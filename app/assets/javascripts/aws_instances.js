
$(document).ready(function() {
  // capture these first, then table is mutated once we hit dataTable 
  var column_mappings = {
    "linux": $('#aws_info th.linux').map(function(i, e) {
      return e.getAttribute('class').split(/\s+/)[0];
    }).toArray(),
    "mswin": $('#aws_info th.mswin').map(function(i, e) {
      return e.getAttribute('class').split(/\s+/)[0];
    }).toArray(),
    "all": $('#aws_info th.all').map(function(i, e) {
      return e.getAttribute('class').split(/\s+/)[0];
    }).toArray()
  };
  var default_sort_column_index = $("#aws_info th.linux_cost_per_hour").first().data("index");
  $('#aws_info').dataTable({
    bJQueryUI: true,
    bPaginate: false,
    bStateSave: true,
    aoColumns: $('#aws_info th').map(function(i, e) {
        return {"mData": $(this).attr('class').split(/\s+/)[0]};
    }).toArray(),
    aaSorting: [[default_sort_column_index, 'asc']],
    aoColumnDefs: [ 
      { // memory stored as bytes, display as gigabytes
      aTargets : [ "memory" ],
      mDataProp: function(data, type, val){
        if (type === 'set') {
          // store the bytes
          data.memory_bytes = val;
          // store the value as gigabytes
          data.memory_gigabytes = (val / 1073741824).toPrecision(2);
        }
        else if (type === 'display') {
          return data.memory_gigabytes;
        }
        else if (type === 'filter') {
          // filtering happens only on gigabytes
          return data.memory_gigabytes;
        }
        return data.memory_bytes;
      }
    },
    { // storage stored as bytes, display as gigabytes
      aTargets : [ "total_ephemeral_storage" ],
      mDataProp: function(data, type, val){
        if (type === 'set') {
          // store the bytes
          data.storage_bytes = val;
          // store the value as gigabytes
          data.storage_gigabytes = (val / 1073741824);
        }
        else if (type === 'display') {
          return data.storage_gigabytes;
        }
        else if (type === 'filter') {
          // filtering happens only on gigabytes
          return data.storage_gigabytes;
        }
        return data.storage_bytes;
      }
    },
    { // hide windows and spend breakdown columns
      aTargets : $("#aws_info th[data-default-visible='false']").map(function(i, e) { 
          return e.getAttribute('class').split(/\s+/)[0]; 
      }).toArray(),
      bVisible: false
    }
    ],
  }
  )
    var toggleColumnVisibility = function(col_name, options) {
      var awsTable = $('#aws_info').dataTable();
      var column = $.grep(awsTable.fnSettings().aoColumns, function(aoColumn, i) { 
          return aoColumn.mData === col_name; 
      })[0];
      // not 100% sure on this next line. Can also try column.nTh.cellIndex
      var col_id = column.aDataSort[0];
      var col_vis = column.bVisible;
      var set_vis_to = col_vis ? false : true;

      if (options != undefined && options["set_vis_to"] != undefined) {
        set_vis_to = options.set_vis_to
      }

      awsTable.fnSetColumnVis(col_id, set_vis_to);
    };
  $('.columnVisToggleButton').click(function() {
      var col_name = $(this).data('column');
      toggleColumnVisibility(col_name);
    }
   );
  $('.groupColVisToggleButton').click(function() {
      var toggle_group = $(this).data('toggle-group');
      var curr_vis = $(this).data('all-visible');
      var set_vis_to = curr_vis ? false : true;
      $(this).data('all-visible', set_vis_to);
      var column_names = column_mappings[toggle_group];
      $.each(column_names, function(i, col_name) { toggleColumnVisibility(col_name, {set_vis_to: set_vis_to}); });
      if (set_vis_to == true) {
        var column_names = column_mappings["all"];
        $.each(column_names, function(i, col_name) { toggleColumnVisibility(col_name, {set_vis_to: set_vis_to}); });
      }
    }
  );
  $('#region').change(function() {
      window.location = $(this).val();
    }
  );

});
