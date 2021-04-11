# Modified to lock in on CentOS 8.3 for initial Rocky build
#  -Skip G.


config_opts['chroot_setup_cmd'] = 'install tar gcc-c++ redhat-rpm-config redhat-release which xz sed make bzip2 gzip gcc coreutils unzip shadow-utils diffutils cpio bash gawk rpm-build info patch util-linux findutils grep git-core'
config_opts['dist'] = 'el8'  # only useful for --resultdir variable subst
config_opts['releasever'] = '8'
config_opts['package_manager'] = 'dnf'
config_opts['extra_chroot_dirs'] = [ '/run/lock', ]
config_opts['bootstrap_image'] = 'centos:8'


config_opts['dnf.conf'] = """
[main]
keepcache=1
debuglevel=2
reposdir=/dev/null
logfile=/var/log/yum.log
retries=20
obsoletes=1
gpgcheck=0
assumeyes=1
syslog_ident=mock
syslog_device=
metadata_expire=0
mdpolicy=group:primary
#best=0
protected_packages=
module_platform_id=platform:el8
user_agent={{ user_agent }}
install_weak_deps=0

[BaseOS]
name=CentOS-$releasever - Base
#mirrorlist=http://mirrorlist.centos.org/?release=8&arch=$basearch&repo=BaseOS&infra=$infra
baseurl=http://mirror.centos.org/centos/8.3.2011/BaseOS/x86_64/os/
failovermethod=priority
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
gpgcheck=1
skip_if_unavailable=False
#module_hotfixes=1

[AppStream]
name=CentOS-$releasever - AppStream
#mirrorlist=http://mirrorlist.centos.org/?release=8&arch=$basearch&repo=AppStream&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/AppStream/$basearch/os/
baseurl=http://mirror.centos.org/centos/8.3.2011/AppStream/x86_64/os/
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
#module_hotfixes=1

[PowerTools]
name=CentOS-$releasever - PowerTools
#mirrorlist=http://mirrorlist.centos.org/?release=8&arch=$basearch&repo=PowerTools&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/PowerTools/$basearch/os/
baseurl=http://mirror.centos.org/centos/8.3.2011/PowerTools/x86_64/os/
gpgcheck=1
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
#module_hotfixes=1

[Devel]
name=CentOS-$releasever - Devel WARNING! FOR BUILDROOT USE ONLY!
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=Devel&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/Devel/$basearch/os/
baseurl=http://mirror.centos.org/centos/8.3.2011/Devel/x86_64/os/
gpgcheck=1
enabled=1
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
#module_hotfixes=1


[HighAvailability]
name=CentOS-8.3-HighAvailability
baseurl=http://mirror.centos.org/centos-8/8.3.2011/HighAvailability/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
#module_hotfixes=1


[centosplus]
name=CentOS-$releasever - Plus
#mirrorlist=http://mirrorlist.centos.org/?release=8&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/os/
baseurl=http://mirror.centos.org/centos/8.3.2011/centosplus/x86_64/os/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[cr]
name=CentOS-$releasever - cr
baseurl=http://mirror.centos.org/centos/8/cr/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[base-debuginfo]
name=CentOS-$releasever - Debuginfo
baseurl=http://debuginfo.centos.org/8/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[extras]
name=CentOS-$releasever - Extras
#mirrorlist=http://mirrorlist.centos.org/?release=8&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/os/
baseurl=http://mirror.centos.org/centos/8.3.2011/extras/x86_64/os/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
#module_hotfixes=1

[fasttrack]
name=CentOS-$releasever - fasttrack
mirrorlist=http://mirrorlist.centos.org/?release=8&arch=$basearch&repo=fasttrack&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/fasttrack/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[BaseOS-source]
name=CentOS-$releasever - BaseOS Sources
baseurl=http://vault.centos.org/centos/8/BaseOS/Source/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[AppStream-source]
name=CentOS-$releasever - AppStream Sources
baseurl=http://vault.centos.org/centos/8/AppStream/Source/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[PowerTools-source]
name=CentOS-$releasever - PowerTools Sources
baseurl=http://vault.centos.org/centos/8/PowerTools/Source/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[extras-source]
name=CentOS-$releasever - Extras Sources
baseurl=http://vault.centos.org/centos/8/extras/Source/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official

[centosplus-source]
name=CentOS-$releasever - Plus Sources
baseurl=http://vault.centos.org/centos/8/centosplus/Source/
gpgcheck=1
enabled=0
gpgkey=file:///usr/share/distribution-gpg-keys/centos/RPM-GPG-KEY-CentOS-Official
"""
