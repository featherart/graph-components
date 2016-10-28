`import Ember from 'ember'`

DonutGraphComponent = Ember.Component.extend(
  tagName: 'div'
  height: 360
  width: 360
  # set innerRadius to 200 to make a pie chart
  # set it to 20 to make a skinny donut
  innerRadius: 100
  useArray: false
  colorArray: ["rgb( 20, 40, 100)", "rgb( 40, 80, 200)", "rgb( 75, 150, 375)", "rgb( 80, 160, 400)", "rgb( 20, 40, 100)", "rgb(210, 255, 255)", "rgb(115, 230, 255)"]

  didInsertElement: ->
    dataset = @dataset.dataset
    height = @get('height')
    width = @get('width')

    radius = Math.min(@get('width'), @get('height')) / 2

    if @get('useArray')
      color = d3.scale.ordinal().range(@get('colorArray'))
    else
      color = d3.scale.category20c()

    arc = d3.svg.arc()
            .outerRadius(radius - 10)
            .innerRadius(radius - @get('innerRadius'))

    pie = d3.layout.pie()
    data = dataset.data
    pie.value((data) ->
      data.value
    ).sort(null)

    svg = d3.select('.donut-graph')
          .append('svg')
          .attr('width', height)
          .attr('height', width)
          .append('g')
          .attr('transform', "translate(#{width/2}, #{height/2})")

    g = svg.selectAll(".arc")
          .data(pie(data))
          .enter().append("g")
          .attr("class", "arc")

    g.append("path").attr("d", arc)
          .style("fill", (d) ->
            color(d.data.name)
           )

    g.append("text")
          .attr("transform", (d) ->
            return "translate(" + arc.centroid(d) + ")" )
          .attr("dy", ".35em")
          .text((d) ->
            return d.data.name
          )

  didDestroyElement: ->
    console.log 'need to figure this out'

)

`export default DonutGraphComponent`
