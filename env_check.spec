%global     debug_package %{nil}

Name:               env_check
Version:            0.1
Release:            1
Summary:            A tool for "health checking" after operating system upgrade
License:            MulanPSL-2.0
URL:                https://gitee.com/openeuler/env_check
BuildArch:          noarch
Source0:            %{name}-%{version}.tar.gz
BuildRequires:      python3
Requires:      python3

%description
A tool for "health checking" after operating system upgrade

%prep
%setup -c -n %{name}-%{version}

%build

%install
mkdir -p %{buildroot}/usr/local/env_check
/bin/cp -r sut %{buildroot}/usr/local/env_check/

%files
/usr/local/env_check

%doc README.md
%license LICENSE.txt

%post
if test -e %{_bindir}/env_check || test -L %{_bindir}/env_check; then \
    rm -f %{_bindir}/env_check; \
fi
ln -s /usr/local/env_check/sut/env_check.py %{_bindir}/env_check
chmod +x %{_bindir}/env_check

%postun
if test -e %{_bindir}/env_check || test -L %{_bindir}/env_check; then \
    rm -f %{_bindir}/env_check; \
fi

%changelog
* Thu Aug 17 2023 Cichen Wang <wangcichen@cmss.chinamobile.com> - 0.1
- Package init
