`import Ember from 'ember'`

ChloroplethGraphComponent = Ember.Component.extend(

  didInsertElement: ->
    width = 960
    height = 600
    rateById = d3.map()
    quantile = d3.scale.quantile().range(d3.range(9).map((i) ->
      'q' + i + '-9'
    ))
    projection = d3.geo.albersUsa().scale(1280).translate([
      width / 2
      height / 2
    ])
    path = d3.geo.path().projection(projection)
    svg = d3.select('chloropleth-graph').append('svg').attr('width', width).attr('height', height)

    d3.json("./topo.json", (error, world) ->
      svg.append("path")
          .datum(topojson.feature(world, world.objects.land))
          .attr("class", "land")
          .attr("d", path)
     )

    ready = (error, us) ->
      if error
        throw error
      quantile.domain rateById.values()
      svg.append('g').attr('class', 'counties').selectAll('path').data(topojson.feature(us, us.objects.counties).features).enter().append('path').attr('class', (d) ->
        quantile rateById.get(d.id)
      ).attr 'd', path
      svg.append('path').datum(topojson.mesh(us, us.objects.states, (a, b) ->
        a != b
      )).attr('class', 'states').attr 'd', path
      return

    # queue().defer(d3.json, './us.json').defer(d3.tsv, './unemployment.tsv', (d) ->
    #   rateById.set d.id, +d.rate
    #   return
    # ).await ready
    d3.select(self.frameElement).style 'height', height + 'px'

)

`export default ChloroplethGraphComponent`
