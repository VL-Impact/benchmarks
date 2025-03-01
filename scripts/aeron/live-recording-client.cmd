::
:: Copyright 2015-2022 Real Logic Limited.
::
:: Licensed under the Apache License, Version 2.0 (the "License");
:: you may not use this file except in compliance with the License.
:: You may obtain a copy of the License at
::
:: https://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
:: See the License for the specific language governing permissions and
:: limitations under the License.
::
@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "DIR=%~dp0"

call "%DIR%\..\run-java.cmd" ^
  -Duk.co.real_logic.benchmarks.remote.message.transceiver=uk.co.real_logic.benchmarks.aeron.remote.LiveRecordingMessageTransceiver ^
  -Daeron.archive.recording.events.enabled=true ^
  -Daeron.archive.recording.events.channel="aeron:ipc" ^
  uk.co.real_logic.benchmarks.remote.LoadTestRig ^
  "%DIR%\low-latency-driver.properties" ^
  "%DIR%\low-latency-archive.properties" ^
  "%DIR%\benchmark.properties" ^
  %*
