`import Ember from 'ember'`

GlobeGraphComponent = Ember.Component.extend(
  width: 800
  height: 600

  # make globe smaller or larger
  scale: 250

  # mostly important that they are different
  landColor: 'rgb(50, 150, 200)';
  boundaryColor: 'rgb(150, 200, 250)';

  didInsertElement: ->
    width = @get('width')
    height = @get('height')
    scale = @get('scale')
    landColor = @get('landColor')
    boundaryColor = @get('boundaryColor')

    projection = d3.geo.orthographic()
        .scale(scale)
        .translate([width / 2, height / 2])
        .clipAngle(90)

    path = d3.geo.path()
             .projection(projection)

    alpha = d3.scale.linear()
              .domain([0, width])
              .range([-180, 180])

    beta = d3.scale.linear()
             .domain([0, height])
             .range([90, -90]);

    svg = d3.select(".globe-graph").append("svg")
            .attr("width", width)
            .attr("height", height)

    svg.on("mousemove", ->
      p = d3.mouse(@)
      projection.rotate([alpha(p[0]), beta(p[1])])
      svg.selectAll("path").attr("d", path))

    d3.json("./topo.json", (error, world) ->

      svg.append("path", ".graticule")
          .datum(topojson.feature(world, world.objects.land))
          .attr("class", "land")
          .attr("d", path)

      svg.append("path")
          .datum(topojson.feature(world, world.objects.countries))
          .attr("class", "boundary")
          .attr("d", path)
          .attr("fill", landColor)
          .attr("stroke", boundaryColor)
     )
)

`export default GlobeGraphComponent`
