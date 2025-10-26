.. PostTroll 文档主文件，由
   sphinx-quickstart 在 2012年9月11日 12:58:14 创建。
   您可以完全按照自己的喜好修改此文件，但至少应包含
   根 `toctree` 指令。

PostTroll
=========

PostTroll 是 pytroll_ 的消息系统。

典型用途是用于事件驱动的生产链，使用消息进行通知。

要获取软件，请访问 github_。

.. _pytroll: http://www.pytroll.org
.. _github: http://github.com/pytroll/posttroll

.. contents::
   :local:
   :depth: 2



使用示例
--------

这个库的主要使用是 :class:`posttroll.message.Message`、
:class:`posttroll.subscriber.Subscribe` 和
:class:`posttroll.publisher.Publish` 类，但 `nameserver` 脚本也是
必需的。`nameserver` 脚本允许注册数据发布者，然后让订阅者找到它们。
以下是 `nameserver` 脚本的用法::

  usage: nameserver [-h] [-d {start,stop,status,restart}] [-l LOG] [-v]

  可选参数:
    -h, --help            显示此帮助消息并退出
    -d {start,stop,status,restart}, --daemon {start,stop,status,restart}
                          作为守护进程运行
    -l LOG, --log LOG     要记录到的文件（默认为标准输出）
    -v, --verbose         同时打印调试消息
    --no-multicast        禁用通过组播广播地址


因此，在启动名称服务器后，让两个进程通信相当简单。
以下是发布代码示例::

        from posttroll.publisher import Publish
        from posttroll.message import Message
        import time

        try:
            with Publish("a_service", 9000) as pub:
                counter = 0
                while True:
                    counter += 1
                    message = Message("/counter", "info", str(counter))
                    print "publishing", message
                    pub.send(str(message))
                    time.sleep(3)
        except KeyboardInterrupt:
            print "terminating publisher..."

订阅代码::

    from posttroll.subscriber import Subscribe

    with Subscribe("a_service", "counter",) as sub:
        for msg in sub.recv():
            print msg

还有一个线程化的监听器容器，可以在类内部使用，
用于持续监控传入的消息::

        from posttroll.publisher import NoisyPublisher
        from posttroll.listener import ListenerContainer
        from posttroll.message import Message
        import time

        pub = NoisyPublisher("test")
        pub.start()
        sub = ListenerContainer(topics=["/counter"])
        # 等待 sub 和 pub 都向名称服务器注册
        time.sleep(3)
        for counter in range(5):
            msg_out = Message("/counter", "info", str(counter))
            pub.send(str(msg_out))
            print "published", str(msg_out)
            msg_in = sub.output_queue.get(True, 1)
            print "received", str(msg_in), ""
        pub.stop()
        sub.stop()

如果您不想通过组播将地址广播到网络中的名称服务器，
您可以使用 *--no-multicast* 参数启动名称服务器。这样做的话，您必须
在发布代码中明确指定名称服务器::

        from posttroll.publisher import Publish
        from posttroll.message import Message
        import time

        try:
            with Publish("a_service", 9000, nameservers=['localhost']) as pub:
                counter = 0
                while True:
                    counter += 1
                    message = Message("/counter", "info", str(counter))
                    print "publishing", message
                    pub.send(str(message))
                    time.sleep(3)
        except KeyboardInterrupt:
            print "terminating publisher..."

.. seealso:: :class:`posttroll.publisher.Publish`
             和 :class:`posttroll.subscriber.Subscribe`

配置参数
--------

通过 Donfig 配置对象可用的全局配置变量：
- tcp_keepalive
- tcp_keepalive_cnt
- tcp_keepalive_idle
- tcp_keepalive_intvl
- multicast_interface
- mc_group

设置 TCP 保活
-------------

如果发布者和订阅者之间的网络连接似乎会断开，
可以通过环境变量设置 TCP 保活设置。
以下是一些基本的示例值::

    import os

    os.environ["POSTTROLL_TCP_KEEPALIVE"] = "1"
    os.environ["POSTTROLL_TCP_KEEPALIVE_CNT"] = "10"
    os.environ["POSTTROLL_TCP_KEEPALIVE_IDLE"] = "1"
    os.environ["POSTTROLL_TCP_KEEPALIVE_INTVL"] = "1"

这些值需要在创建任何订阅者/发布者之前设置才能生效。
另一个选项是在 shell 初始化中设置这些值，比如 ``$HOME/.bashrc``。

有关 0MQ TCP 保活的更多信息，请参阅 zmq_setsockopts_ 获取相关套接字选项。

.. _zmq_setsockopts: http://api.zeromq.org/master:zmq-setsockopt


使用安全的 ZeroMQ 后端
----------------------

要在 posttroll 中使用安全认证的套接字（使用 ZMQ 的曲线认证），
需要通过 posttroll 配置系统定义后端，例如使用环境变量::

   POSTTROLL_BACKEND=secure_zmq

在服务器端（例如发布者），我们需要定义服务器的密钥和
接受的客户端密钥所在的目录::

   POSTTROLL_SERVER_SECRET_KEY_FILE=/path/to/server.key_secret
   POSTTROLL_CLIENTS_PUBLIC_KEYS_DIRECTORY=/path/to/client_public_keys/

在客户端（例如订阅者），我们需要定义服务器的公钥文件和
客户端的密钥文件::

   POSTTROLL_CLIENT_SECRET_KEY_FILE=/path/to/client.key_secret
   POSTTROLL_SERVER_PUBLIC_KEY_FILE=/path/to/server.key

这些设置也可以使用 posttroll 配置对象设置，例如::

   >>> from posttroll import config
   >>> with config.set(backend="secure_zmq", server_public_key_file="..."):
   ...

posttroll 配置使用 donfig，更多信息请查看 https://donfig.readthedocs.io/en/latest/。


生成公钥和密钥对
****************

为了使安全 ZMQ 后端工作，需要生成公钥/密钥对，
一个用于客户端，一个用于服务器端。
为此提供了一个命令行脚本::

   > posttroll-generate-keys -h
   usage: posttroll-generate-keys [-h] [-d DIRECTORY] name

   为安全 zmq 后端创建一个公钥/密钥对。这将创建两个文件（如果未另行指定，则在当前目录中），后缀为 '.key' 和 '.key_secret'。文件名将是提供的名称。

   位置参数:
     name                  文件名。

   选项:
     -h, --help            显示此帮助消息并退出
     -d DIRECTORY, --directory DIRECTORY
                           放置密钥的目录。


从旧版 posttroll 迁移
---------------------

从旧版本的 posttroll（v0.2 之前）迁移，需要进行一些调整。
服务现在具有 *别名* 而不是 *数据类型*。因此，对于发布，
以下调用::

  with Publish("a_service", ["data_type1", "data_type2"], 9000) as pub:

应该翻译为::

  with Publish("a_service", 9000, ["data_type1", "data_type2"]) as pub:

在订阅者端，以下代码::

  with Subscribe("data_type1") as sub:


必须更改为::

  with Subscribe("a_service") as sub:

请注意，行为已更改：将迭代来自发布者 *a_service* 的所有消息，
包括具有您想要的数据类型之外的其他数据类型的消息。
这就是为什么现在可以在 :class:`posttroll.subscriber.Subscribe` 调用中
直接添加主题过滤器::

  with Subscribe("a_service", "data_type1") as sub:

这意味着您感兴趣的消息的主题应该以 "data_type1" 开头...

处理时区感知的 datetime 对象
-----------------------------

历史上，posttroll 不支持时区感知的 datetime 对象，
例如对它们进行编码或解码会导致问题。
最新版本的 posttroll 已修复此问题，但是使用这些版本发送的消息不向后兼容。
为确保向后兼容性，可以将 posttroll 配置为发送在编码时删除时区信息的消息。
这可以通过环境变量完成::

  POSTTROLL_MESSAGE_VERSION=v1.01

或在 python 代码中::

   >>> from posttroll import config
   >>> with config.set(message_version="v1.01"):
   ...


API
---

发布者
~~~~~~

.. automodule:: posttroll.publisher
   :members:
   :undoc-members:

订阅者
~~~~~~

.. automodule:: posttroll.subscriber
   :members:
   :undoc-members:

消息
~~~~

.. automodule:: posttroll.message
   :members:
   :undoc-members:

地址接收器
~~~~~~~~~~

.. automodule:: posttroll.address_receiver
   :members:
   :undoc-members:

名称服务器
~~~~~~~~~~

.. automodule:: posttroll.ns
   :members:
   :undoc-members:


组播
~~~~

上下文
++++++

.. automodule:: posttroll.message_broadcaster
   :members:
   :undoc-members:

组播代码
++++++++

.. automodule:: posttroll.bbmcast
   :members:
   :undoc-members:

杂项
~~~~

.. automodule:: posttroll
   :members:
   :undoc-members:


索引和表格
==========

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
