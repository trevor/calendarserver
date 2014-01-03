----
-- Copyright (c) 2012-2014 Apple Inc. All rights reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
----

---------------------------------------------------
-- Upgrade database schema from VERSION 27 to 28 --
---------------------------------------------------

-- Calendar home related updates

alter table CALENDAR_HOME_METADATA
 add ("DEFAULT_POLLS" integer default null references CALENDAR on delete set null);

create index CALENDAR_HOME_METADAT_910264ce on CALENDAR_HOME_METADATA (
    DEFAULT_POLLS
);


-- Now update the version
-- No data upgrades
update CALENDARSERVER set VALUE = '28' where NAME = 'VERSION';
