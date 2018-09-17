#
# spec file for package doc-kit
#
# Copyright (c) 2013 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#


Name:           doc-kit
# project version number
Version:        0.2
Release:        0
Summary:        Initialize and Update Documentation Repositories
License:        GPL-2.0+
Group:          System/X11/Fonts
Url:            https://github.com/sknorr/doc-kit
Source0:        %{name}-%{version}.tar.bz2
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch

%description
doc-kit allows for the following:
* Initialize SUSE or openSUSE documentation repositories.
* Update boilerplate files contained in documentation repositories.

%prep
%setup -c %{name}-%{version}

%build

%install
cd %{name}-%{version}
mkdir -p %{buildroot}%{_bindir}
install -m755 doc-kit %{buildroot}%{_bindir}

mkdir -p %{buildroot}%{_defaultdocdir}/%{name}
install -m644 LICENSE %{buildroot}%{_defaultdocdir}/%{name}
install -m644 README.md %{buildroot}%{_defaultdocdir}/%{name}

%files
%defattr(-,root,root)

%{_bindir}/*

%dir %{_defaultdocdir}/%{name}
%doc %{_defaultdocdir}/%{name}/*

%changelog
