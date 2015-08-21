#
# Cookbook Name:: learn_chef_marius
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# This should be conditional on OS being linux at very least!

if platform?('linuxmint') && node['platform_version'] >= '17.1'
   package ['openssh-server', 'pidgin', 'finch', 'chromium-browser', 'xwrits', 'rhythmbox', 'eclipse', 'mint-meta-mate', 'mrxvt', 'gedit', 'xsane', 'mplayer', 'busybox', 'sudo', 'screen', 'vim', 'cdrdao', 'skype', 'gimp', 'graphicsmagick', 'sysstat', 'encfs', 'iotop', 'latencytop', 'eclipse', 'eclipse-rse', 'eog', 'ncftp', 'libreoffice-calc', 'libreoffice-writer', 'libreoffice-impress', 'netpbm', 'sox', 'lame', 'rcs', 'wine', 'lsscsi', 'unrar', 'cabextract', 'gstreamer*-plugins*', 'gnucash', 'cups', 'lshw', 'pptp-linux', 'id3', 'gnokii', 'xgnokii', 'mtr', 'htmldoc', 'cups-pdf', 'tftpd', 'nmap', 'proftpd', 'vlc', 'pidgin-plugin-pack', 'pidgin-skype', 'xfce4', 'mate-desktop', 'unixODBC', 'libmyodbc', 'barry*', 'lynx', 'gpm', 'mplayer-gui', 'gcc', 'strace', 'ltrace', 'eclipse-cdt', 'smartmontools', 'libasound2', 'libexpat1', 'libfontconfig1', 'libgl1-mesa-glx', 'libglapi-mesa', 'libpulse0', 'vlc-plugin-sdl', 'libsmpeg0', 'nfs-common', 'traceroute', 'tcl-tls', 'tk8.5', 'whois', 'vym', 'mtpfs', 'evince', 'workrave', 'thunderbird', 'apt-file', 'vim-gnome', 'git', 'xclip', 'xvfb', 'mate-screensaver', 'keepass2', 'keepassx', 'ia32-libs', 'ia32-libs-gtk']
elsif platform?('linuxmint') && node['platform_version'] >= '13'
   package['pidgin','finch','chromium-browser','xwrits','rhythmbox','eclipse','mint-meta-mate','mrxvt','gedit','xsane','mplayer','busybox','sudo','','screen','vim','cdrdao','skype','gimp','graphicsmagick','sysstat','encfs','iotop','latencytop','eclipse','eclipse-rse','eog','ncftp','','libreoffice-calc','libreoffice-writer','libreoffice-impress','netpbm','','sox','lame','rcs','wine','lsscsi','unrar','cabextract','gstreamer-plugins*','','gnucash','cups','lshw','pptp-linux','id3','gnokii','xgnokii','mtr','htmldoc','cups-pdf','','tftpd','nmap','proftpd','vlc','pidgin-plugin-pack','pidgin-skype','xfce4','','mate-desktop','unixODBC','libmyodbc','barry*','lynx','gpm','','mplayer-gui','gcc','strace','ltrace','eclipse-cdt','smartmontools','libasound2','libexpat1','libfontconfig1','libgl1-mesa-glx','libglapi-mesa','libpulse0','vlc-plugin-sdl','libsmpeg0','nfs-common','traceroute','tcl-tls','tk8.5','whois','vym','mtpfs','evince','workrave','thunderbird','apt-file','vim-gnome','git','xclip','xvfb','mate-screensaver*','keepass2','keepassx']
end

service 'ssh' do
   supports :status => true
   action [:enable, :start]
end

user 'keving' do
  comment 'A keving user'
  uid '1000'
  gid '1000'
  home '/home/keving'
  shell '/bin/bash'
  password '$6$bi89qoMz$huygswU9AdDSlu0xz9nEv/aTeuSQJl4BM6V5EZjaJpO56.L9KlXm0yKZZS7LV8uAOrU9XTUP6SB4MIQr.99p71'
end

if platform?('linuxmint')
   template '/home/keving/.mrxvtrc' do
      source 'mrxvtrc.erb'
      owner 'keving'
      group 'keving'
      mode '0644'
   end
   
   template '/usr/share/applications/mrxvt.desktop' do
      source 'mrxvt.desktop.erb'
      owner 'root'
      group 'root'
      mode '0644'
   end
end

# Additional testing of line by line.
template '/home/keving/test.txt' do
   source 'test.txt.erb'
   owner 'root'
   group 'root'
   mode '0644'
end

ruby_block "test search and replace on a line" do
  block do
    fe = Chef::Util::FileEdit.new("/home/keving/test.txt")
    fe.search_file_replace_line(/^Templated.*/,'File line templated this time.')
    fe.write_file
  end
end

if node['wibble_test'] == 'true'
   log 'message' do
      message 'Got parameter wibble_test'
      level :info
   end
end
