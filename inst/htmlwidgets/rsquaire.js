HTMLWidgets.widget({

  name: 'rsquaire',

  type: 'output',

  factory: function(el, width, height) {


    return {

      renderValue: function(x) {
        
       var options = {
         colors: d3.scale.quantize().domain([1,5]).range(x.options.colors),
		     el: '#' + el.id,
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
		     }
       };
          
        // update squaire obect
       var map = new Squaire(x.data, options);
        
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
