@echo off

rem CenterCLR.NamingFormatter - String format library with key-valued replacer.
rem Copyright (c) 2019 Kouji Matsui (@kekyo2)
rem 
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem 
rem http://www.apache.org/licenses/LICENSE-2.0
rem 
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

if exist artifacts (
    ren artifacts artifacts_
    rmdir /s /q artifacts_
)
mkdir artifacts

rem "dotnet" command can't build net35 tfm.
rem dotnet clean -c Release -p:Platform=AnyCPU CenterCLR.NamingFormatter\CenterCLR.NamingFormatter.csproj
rem dotnet restore
rem dotnet pack -p:Configuration=Release -p:Platform=AnyCPU -o artifacts CenterCLR.NamingFormatter\CenterCLR.NamingFormatter.csproj

msbuild -t:restore
msbuild -t:pack -p:Configuration=Release /p:PackageOutputPath=..\artifacts CenterCLR.NamingFormatter\CenterCLR.NamingFormatter.csproj
