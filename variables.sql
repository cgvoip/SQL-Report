DEFINE num_days=0;
DEFINE report_type='text';
--
COL bsnap NEW_VALUE begin_snap
COL esnap NEW_VALUE end_snap
--
select max(snap_id) bsnap from dba_hist_snapshot
where begin_interval_time < sysdate-1;
--
select max(snap_id) esnap from dba_hist_snapshot;
--
COL idname NEW_VALUE dbid
COL dname  NEW_VALUE db_name
COL inum   NEW_VALUE inst_num
COL iname  NEW_VALUE inst_name
--
select d.dbid idname, lower(d.name) dname,
i.instance_number inum, i.instance_name iname
from v$database d, v$instance i;
--
-- Set the name for the report
DEFINE report_name='/orahome/scripts/awrrpt.&&db_name..txt'
