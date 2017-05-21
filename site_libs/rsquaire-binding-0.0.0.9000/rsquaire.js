HTMLWidgets.widget({

  name: 'rsquaire',

  type: 'output',

  factory: function(el, width, height) {
    return {

      renderValue: function(x) {
        
var layout = x.options.layout ||
 [[0,0,"AK"],[10,0,"ME"],[9,1,"VT"],[10,1,"NH"],[0,2,"WA"],[1,2,"ID"],[2,2,"MT"],[3,2,"ND"],[4,2,"MN"],[6,2,"MI"],[8,2,"NY"],[9,2,"MA"],[10,2,"RI"],[0,3,"OR"],[1,3,"UT"],[2,3,"WY"],[3,3,"SD"],[4,3,"IA"],[5,3,"WI"],[6,3,"IN"],[7,3,"OH"],[8,3,"PA"],[9,3,"NJ"],[10,3,"CT"],[0,4,"CA"],[1,4,"NV"],[2,4,"CO"],[3,4,"NE"],[4,4,"MO"],[5,4,"IL"],[6,4,"KY"],[7,4,"WV"],[8,4,"VA"],[9,4,"MD"],[10,4,"DE"],[1,5,"AZ"],[2,5,"NM"],[3,5,"KS"],[4,5,"AR"],[5,5,"TN"],[6,5,"NC"],[7,5,"SC"],[8,5,"DC"],[3,6,"OK"],[4,6,"LA"],[5,6,"MS"],[6,6,"AL"],[7,6,"GA"],[0,7,"HI"],[3,7,"TX"],[8,7,"FL"]];

var labels = x.options.labels || {'AK': {'full': 'Alaska', 'short': 'AK', 'ap': 'Alaska'}, 'AL': {'full': 'Alabama', 'short': 'AL', 'ap': 'Ala.'}, 'AR': {'full': 'Arkansas', 'short': 'AR', 'ap': 'Ark.'}, 'AZ': {'full': 'Arizona', 'short': 'AZ', 'ap': 'Ariz.'}, 'CA': {'full': 'California', 'short': 'CA', 'ap': 'Calif.'}, 'CO': {'full': 'Colorado', 'short': 'CO', 'ap': 'Colo.'}, 'CT': {'full': 'Connecticut', 'short': 'CT', 'ap': 'Conn.'}, 'DC': {'full': 'District of Columbia', 'short': 'DC', 'ap': 'D.C.'}, 'DE': {'full': 'Delaware', 'short': 'DE', 'ap': 'Del.'}, 'FL': {'full': 'Florida', 'short': 'FL', 'ap': 'Fla.'}, 'GA': {'full': 'Georgia', 'short': 'GA', 'ap': 'Ga.'}, 'HI': {'full': 'Hawaii', 'short': 'HI', 'ap': 'Hawaii'}, 'IA': {'full': 'Iowa', 'short': 'IA', 'ap': 'Iowa'}, 'ID': {'full': 'Idaho', 'short': 'ID', 'ap': 'Idaho'}, 'IL': {'full': 'Illinois', 'short': 'IL', 'ap': 'Ill.'}, 'IN': {'full': 'Indiana', 'short': 'IN', 'ap': 'Ind.'}, 'KS': {'full': 'Kansas', 'short': 'KS', 'ap': 'Kan.'}, 'KY': {'full': 'Kentucky', 'short': 'KY', 'ap': 'Ky.'}, 'LA': {'full': 'Louisiana', 'short': 'LA', 'ap': 'La.'}, 'MA': {'full': 'Massachusetts', 'short': 'MA', 'ap': 'Mass.'}, 'MD': {'full': 'Maryland', 'short': 'MD', 'ap': 'Md.'}, 'ME': {'full': 'Maine', 'short': 'ME', 'ap': 'Maine'}, 'MI': {'full': 'Michigan', 'short': 'MI', 'ap': 'Mich.'}, 'MN': {'full': 'Minnesota', 'short': 'MN', 'ap': 'Minn.'}, 'MO': {'full': 'Missouri', 'short': 'MO', 'ap': 'Mo.'}, 'MS': {'full': 'Mississippi', 'short': 'MS', 'ap': 'Miss.'}, 'MT': {'full': 'Montana', 'short': 'MT', 'ap': 'Mont.'}, 'NC': {'full': 'North Carolina', 'short': 'NC', 'ap': 'N.C.'}, 'ND': {'full': 'North Dakota', 'short': 'ND', 'ap': 'N.D.'}, 'NE': {'full': 'Nebraska', 'short': 'NE', 'ap': 'Neb.'}, 'NH': {'full': 'New Hampshire', 'short': 'NH', 'ap': 'N.H.'}, 'NJ': {'full': 'New Jersey', 'short': 'NJ', 'ap': 'N.J.'}, 'NM': {'full': 'New Mexico', 'short': 'NM', 'ap': 'N.M.'}, 'NV': {'full': 'Nevada', 'short': 'NV', 'ap': 'Nev.'}, 'NY': {'full': 'New York', 'short': 'NY', 'ap': 'N.Y.'}, 'OH': {'full': 'Ohio', 'short': 'OH', 'ap': 'Ohio'}, 'OK': {'full': 'Oklahoma', 'short': 'OK', 'ap': 'Okla.'}, 'OR': {'full': 'Oregon', 'short': 'OR', 'ap': 'Ore.'}, 'PA': {'full': 'Pennsylvania', 'short': 'PA', 'ap': 'Pa.'}, 'RI': {'full': 'Rhode Island', 'short': 'RI', 'ap': 'R.I.'}, 'SC': {'full': 'South Carolina', 'short': 'SC', 'ap': 'S.C.'}, 'SD': {'full': 'South Dakota', 'short': 'SD', 'ap': 'S.D.'}, 'TN': {'full': 'Tennessee', 'short': 'TN', 'ap': 'Tenn.'}, 'TX': {'full': 'Texas', 'short': 'TX', 'ap': 'Texas'}, 'UT': {'full': 'Utah', 'short': 'UT', 'ap': 'Utah'}, 'VA': {'full': 'Virginia', 'short': 'VA', 'ap': 'Va.'}, 'VT': {'full': 'Vermont', 'short': 'VT', 'ap': 'Vt.'}, 'WA': {'full': 'Washington', 'short': 'WA', 'ap': 'Wash.'}, 'WI': {'full': 'Wisconsin', 'short': 'WI', 'ap': 'Wis.'}, 'WV': {'full': 'West Virginia', 'short': 'WV', 'ap': 'W.Va.'}, 'WY': {'full': 'Wyoming', 'short': 'WY', 'ap': 'Wyo.'} };

var colorscale = d3.scale.quantize().domain([x.indexmin, x.indexmax]).range(x.options.colors);

if(x.options.indexType == "string") {
  colorscale = d3.scale.ordinal().domain(x.categories).range(x.options.colors);
}  


 var options = {
		     el: "#" + el.id,
		     layout: layout,
		     labels: labels,
		     labelStyle: x.options.labelStyle,
		     index: x.options.index,
		     indexType: x.options.indexType,
		     colors: colorscale,
		     tooltip: {
		       enabled: x.options.tooltip.enabled,
		       tooltipLayout: false,
		       mode: x.options.tooltip.mode,
		       column1: x.options.tooltip.column1,
		       column2: x.options.tooltip.column2,
		       whitelist: x.options.tooltip.whitelist,
		       noteIndex: x.options.tooltip.noteIndex,
		       el: "#" + el.id + "-toolbox"
		       }
       };

      carto = new Squaire(x.data, options);
      },

      resize: function(width, height) {

        carto.resizeMap();

      }
      
    };
  }
});
