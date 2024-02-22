# 121DockerFiles

<p>The Repository of all images that you would use for a local env.</p>
<p>Please read this notes first.</p>
<p>
There are commands to make your life easier when using this repo. 
</p>
<p>You'll need 
to install the "make" command. Check on Google instructions for your OS on how to install this tool. </p>
<p>You need to have installed 
    <a href="https://docs.docker.com/compose/install/compose-plugin/"> docker-compose-plugin</a> if you are
    a linux user, 
    else nothing will work. With that you can now do "docker compose" instead of "docker-compose".</p>
<p>You have to be able to run docker without "sudo".</p>
<p>Remember to stop any service that is occupying the port 80, since it 
    will make a conflict with the reverse-proxy-apache. Usually the webserver that
    you've installed will be occupying that port.</p>
<h1>Commands</h1>
<p>
This repo comes with certain "commands" that will let you create environments faster.
</p>
<p>Some commands are used on the stacks that are generated. Some are executed from the root of this repo.</p>

<h3>Repo root commands</h3>
<p>To execute any of this commands you have to be on the root of this repo.</p> 
<p>Some commands come with default parameters, anything that uses a default
    value, if nothing is entered, will have the value between [].<br/>
    E.G "Enter port:[22]", when you see a text like this, it means that for
    that required input, the default value 22 will be used if nothing is entered.
</p>
<p>The command are the following:
<ul>
    <li>
        <strong style="color: yellowgreen">make build</strong>: 
        <strong style="color: #cc2525">First command you should always execute</strong>.
        This command will build the different images used for a local env. 
        Also, it will create some default files and directories that are necessary.
    </li>
    <li>
        <strong style="color: yellowgreen">make build-arm</strong>: 
        same as the above but for arm processors.
        <strong style="color: #cc2525">First command you should always execute</strong>.
        </li>
    <li>
        <strong style="color: yellowgreen">make start</strong>:
        after executing one of the above, then execute this one. 
        It will start portainer, reverse proxy apache, and mailhog stacks. 
        The most important thing this does, it to create the reverse proxy network
        that the envs will use. These containers will automatically restart, 
        unless you stop them manually. This is also true when you restart your computer, 
        so they are always up once started.
        <strong style="color: #cc2525">Don't skip this command</strong>.
    </li>
    <li>
        <strong style="color: yellowgreen">make stop</strong>:
        It will stop the containers that are started with the above command.
    </li>
    <li>
        <strong style="color: yellowgreen">make create-env</strong>:
        <strong style="color: #cc2525">don't execute this without 
        executing at least once one of the build commands and the start command</strong>. 
        It will create a folder in a path you desire, by default 
        <strong style="color: #cfbd08">/home/$USER/docker-stacks/$PROJECT_NAME</strong> . 
        It will tell you to input some configuration, follow the steps and a basic stack for a 
        project will exist.<br/>
        You can change the generated docker-compose.yml to your desire.
        It will also automatically add a vhost for reverse proxy apache
        and an entry in /etc/hosts.
        When it asks for a path to a git repo, is the repository of the project that
        you have in some place in your machine.
    </li>
    <li>
        <strong style="color: yellowgreen">make add-host</strong>: 
        it will add an entry in the /etc/hosts file,
        for the input domain with 127.0.0.1 address. If the address already exists then, it won't do anything.
    </li>
    <li>
        <strong style="color: yellowgreen">make remove-host</strong>: the inverse of the above command.
    </li>
    <li>
        <strong style="color: yellowgreen">make add-ssh-config</strong>:
        It will create a file if it doesn't exist that is used by openssh(ssh)
        so you can configure a short name for an ssh connection.<br/>
        For more information about this check 
        <a href="https://linuxize.com/post/using-the-ssh-config-file/">this link</a>.  
    </li>
    <li><strong style="color: yellowgreen">make add-pub-key</strong>:
        it will add a pub key to a desired server, so you don't need 
        to use the password for connecting, this is very useful for lexicon servers.<br/>
        It accepts a server name configured with the command above and also
        you can pass a port and name@host. <br/> E.G 
        <strong style="color: #a14df3">
            -p 2727 user@[remote.address.ip|domain]
        </strong>. 
    </li>
</ul>

<h3>Env generated with
<strong style="color: yellowgreen">make create-env</strong> 
commands
</h3>
<p>The sample envs comes with some command to aid you with the db download and importing.</p>
<p>
    Also when you use the create-env command, the sample-env is used as a base and the commands
    are copied there, so you can run it on there as well.
</p>
<p>To execute this commands go to where the stack was created and on 
    the root you can run the following things:</p>
<ul>
    <li>
        <strong style="color: yellowgreen">make run</strong>: 
        starts up all the containers for the stack.
    </li>
    <li>
        <strong style="color: yellowgreen">make stop</strong>: 
        stops all the containers for the stack.
    </li>
    <li>
        <strong style="color: yellowgreen">make down</strong>: 
        stops all the containers for the stack and also destroys them.
    </li>
    <li>
        <strong style="color: yellowgreen">make get-db</strong>: 
        Follow the steps, and it will first generate a dump on the
        the server that you entered before, then it will 
        automatically download it.<br />
        The downloaded db will be put on the dbscripts folder for the stack 
        in which you execute it.
        When it asks for an already present configuration name, check
        where <strong style="color: yellowgreen">add-ssh-config</strong> is explained, for more info.
    </li>
    <li>
        <strong style="color: yellowgreen">make import-db</strong>: 
        It will import the db to the database container. If you choose
        to use a centralized db, don't use this, 
        it will import to the stack database.<br />
        The command above can still be used to retrieve the DB.
    </li>
</ul>

<h1>How to use</h1>
<ol>
    <li>clone this repo</li>
    <li>on the root of the repo run "make build" or "make build-arm", depending on your processor</li>
    <li>on the root of the repo run "make start". 
        This will start portainer, mailhog and reverse proxy apache stacks.<br/>
        It will add them with default domains, so you can access their respective GUIs.<br/>
        Portainer GUI: portainer.local.com<br/>
        Mailhog GUI: mailhog.local.com
    </li>
</ol>
<p>Creating local env:</p>
<ol>
    <li>on the root of the repo run "make create-env"</li>
    <li>enter the values that it requires</li>
    <li>go to the output path, in there you will find the project stack.
    </li>
</ol>

<p>By default it will set up the PHP container for 7.4-composer2, 
        change accordingly.</p>
<p>The webserver will be configured for a MAGE_RUN_TYPE of "store" 
        and for a code "default", change accordingly.<br/></p>
<p>If you need more stores, copy the default web server, 
    update the environment variables and change both 
    the service and container names.
</p>
<p>The default store can be accessed at ${PROJECT_NAME}.local.com</p>

<h1>Notes</h1>
<p>If you see that certain container is running slow, and you have an ARM processor.
    When creating the docker compose, in the service(container) configuration
    you have to add a new node named "platform" and the value should be "linux/arm64/v8".<br/>
    Example bellow.
</p>
<pre>
service_name:
    image: image:tag
    container_name: containerName
    <strong>platform: linux/arm64/v8</strong>#this is what you should add
    #..... and any other configurations
</pre>

<h1>Centralized DB</h1>
<p>
If you prefer to have all DBs in a single container, 
inside the database-compose folder there's an example to 
create one for mariadb:10.4.<br>
You can also use it from the repo itself. For that go to database-compose/mariadb10.4 folder, inside this repo, 
and execute "make run".<br/> By default, the root password is root and the
the port that binds host and db is 1004. If you want to change any of these
values, you can edit the .env file that will be generated by the "make build",
that you should have executed before.<br/>
To access this database with default values: host=localhost,
port=1004
, user=root, and password=root.
</p>

<h1>Makefile</h1>
The makefile for images will have usually one command "image-build". PHP 
is the exception. You should still use the "make build".

<h1>COMMON FOLDER</h1>
<p>
In this folder there is an image that is used to share files between other 
images. Currently, is only used for PHP images. You will have to build this 
image first, before building the others.
</p>

<h1>NGINX</h1>
<p>
The nginx image, for the time being is only a single directory. Since we most
likely be using the latest version. If in a future this changes, then images for 
specific versions will be made.
</p>

<h1>MariaDB</h1>
<p>
I created a custom image, so I could install the "pv" command which let's
you monitor how a DB import is progressing with an estimated time of finishing.
Also when it has finished, will show you how long it took.
</p>
<p>The way of using the pv command is the following:</p>
<p>pv dump.sql | mysql -u user -p databaseName</p>
<p>And it will give you approximately how long it will take to import.</p>

<h1>PHP</h1>
<p>In te makefile of the PHP images there are two commands:</p>
<ol>
    <li>
    image-build
    </li>
    <li>
    image-build-arm
    </li>
</ol>
<p>
Since the sendmail binaries can come for ARM or AMD64, those who have ARM
will have to use the second command listed. 
Only use one of the two, since the image tag is the same for both commands.
</p>

<h1>Bash scripts</h1>
<p>Inside the shell-tools folder a lot of .sh files 
    reside that are used for the automated process of building images 
    and creating local envs</p>
<p>You have to use the corresponding "make" command
    depending on your CPU architecture</p>
