%define APP_BUILD_DATE %(date +'%%Y%%m%%d_%%H%%M')

Name:       dotfw
Summary:    Dash open testing framework 
Version:    1.0.0
Release:    1
Group:      Development/Tools
License:    LGPL v2.1
BuildArch:  noarch
URL:        http://safrm.net/projects/dotfw
Vendor:     Miroslav Safr <miroslav.safr@gmail.com>
Source0:    %{name}-%{version}.tar.bz2
Autoreq: on
Autoreqprov: on
BuildRequires:  appver >= 1.1.1
BuildRequires: jenkins-support-scripts >= 1.2.4

%description
Light weight collection of testing functions to run various tests for rapid projects.

%prep
%setup -c -n ./%{name}-%{version}

%build
jss-docs-update ./doc -sv %{version} 

%install
rm -fr %{buildroot}
mkdir -p %{buildroot}%{_bindir}
install -m 755 ./dotfw %{buildroot}%{_bindir}
sed -i".bkp" "1,/^VERSION=/s/^VERSION=.*/VERSION=%{version}/" %{buildroot}%{_bindir}/dotfw && rm -f %{buildroot}%{_bindir}/dotfw.bkp
sed -i".bkp" "1,/^VERSION_DATE=/s/^VERSION_DATE=.*/VERSION_DATE=%{APP_BUILD_DATE}/" %{buildroot}%{_bindir}/dotfw && rm -f %{buildroot}%{_bindir}/dotfw.bkp
install -m 755 ./dotfw-network %{buildroot}%{_bindir}
install -m 755 ./dotfw-process %{buildroot}%{_bindir}

mkdir -p %{buildroot}%{_mandir}/man1
install -m 644 ./doc/manpages/dotfw.1* %{buildroot}%{_mandir}/man1/

%clean
rm -fr %{buildroot}

%check
for TEST in $(  grep -r -l -h "#\!/bin/sh" . )
do
		sh -n "$TEST"
		if  [ $? != 0 ]; then
			echo "syntax error in $TEST, exiting.." 
			exit 1
		fi
done 

%files
%defattr(-,root,root,-)
%{_bindir}/dotfw
%{_bindir}/dotfw-network
%{_bindir}/dotfw-process

%{_mandir}/man1/dotfw.1*

