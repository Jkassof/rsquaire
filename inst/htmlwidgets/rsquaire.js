HTMLWidgets.widget({

  name: 'rsquaire',

  type: 'output',

  factory: function(el, width, height) {
    
    return {

      renderValue: function(x) {
        
//         $(function() {
//   $("#map-container").eq(0).after("<div id = map-container-toolbox class = squaire// -toolbox></div>");
// });
//         
     
       var data = x.data;
       var options = {
		     el: "#map-container",
		     index: x.options.index,
		     labelStyle: x.options.labelStyle,
		     colors: d3.scale.quantize().domain([x.indexmin,x.indexmax]).range(x.options.colors),
		     indexType: x.options.indexType,
		     tooltip: {
		       enabled: x.options.tooltip.enabled,
		       tooltipLayout: false,
		       mode: x.options.tooltip.mode,
		       column1: x.options.tooltip.column1,
		       column2: x.options.tooltip.column2,
		       whitelist: x.options.tooltip.whitelist,
		       noteIndex: x.options.tooltip.noteIndex
		       }
       };
          

       var carto = new Squaire(data, options);
      
      }

     // resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      //}
    };
  }
});
