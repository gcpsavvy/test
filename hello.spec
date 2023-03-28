Name:           pcmidscripts
Version:        0.0.1
Summary:        PCMID scripts
BuildArch:      noarch
Release:        1%{?dist}
License:        GPL
Source0:        %{name}-%{version}.tar.gz

Requires:       bash

%description
PCMID Scripts

%prep
%setup -q

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT/%{_bindir}
cp banana.sh $RPM_BUILD_ROOT/%{_bindir}
cp hello.sh $RPM_BUILD_ROOT/%{_bindir}

%files
%defattr(-,root,root,-)
/usr/bin/hello.sh
/usr/bin/banana.sh

%changelog
* Tue Mar 28 2023 Manjunath Bheemappa
-
