HTMLWidgets.widget({

  name: 'rsquaire',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        var options = {
		      colors: d3.scale.quantize().domain([1,5]).range(['#c9e2f5','#0098db']),
		      el: '#' + el.id,
	      };
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
