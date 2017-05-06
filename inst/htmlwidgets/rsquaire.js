HTMLWidgets.widget({

  name: 'rsquaire',

  type: 'output',

  factory: function(el, width, height) {
  //  var dummyData = {};
  //  var map = new Squaire(dummyData, {
  //    el: el.id,
  //    tooltip: {
  //      enabled: true,
  //      el: "#" + el.id + "-toolbox"
  //    }
  //  });
    return {

      renderValue: function(x) {
        
        var data = x.data;
       var options = {
         colors: d3.scale.quantize().domain([1,5]).range(x.options.colors),
		     el: "#map-container",
		     labelStyle: x.options.labelStyle,
		     index: x.options.index,
		     indexType: x.options.indexType,
		     tooltip: {
		       enabled: x.options.tooltip.enabled,
		       mode: x.options.tooltip.mode,
		       column1: x.options.tooltip.column1,
		       column2: x.options.tooltip.column2,
		       whitelist: x.options.tooltip.whitelist,
		       noteIndex: x.options.tooltip.noteIndex,
		       el:"#map-container-toolbox"
		     }
       };
          
        // update squaire obect
      var map = new Squaire(data, options);
       
      }

     // resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      //}

    };
  }
});

function draw_map(el){
  var options = {
		colors: d3.scale.quantize().domain([1,5]).range(['#c9e2f5','#0098db']),
		el: '#' + el.id
	};
	var map = new Squaire(x.data, options);
}
