`import Ember from 'ember'`

SidebarGraphComponent = Ember.Component.extend(
  # tagName: 'div'
  yAxisText: ''
  height: 400
  width: 500

  didInsertElement: ->
    margin = {top: 20, right: 20, bottom: 30, left: 40}
    width = @get('width') - margin.left - margin.right
    height = @get('height') - margin.top - margin.bottom
    x = d3.scale.ordinal().rangeRoundBands([0, width], .1)

    y = d3.scale.linear()
        .range([width, 0])

    xAxis = d3.svg.axis()
        .scale(x)
        .orient("left")

    yAxis = d3.svg.axis()
        .scale(y)
        .orient("bottom")
        .ticks(@dataset.dataset.data.length, "")

    svg = d3.select(".bar-graph").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
      .append("g")
      .attr("transform", "translate( #{margin.bottom}, #{margin.left})")

    # SET X AXIS LABELS
    # ANY ALTERATION OF THE VALUE FOR d.name MUST MATCH d.name BELOW
    # OR DATA WILL NOT BE MATCHED TO THE RIGHT COLUMN
    x.domain(@dataset.dataset.data.map((d) ->
      # shorten names
      return d.name.slice(0,2)
    ))
    # SET Y AXIS LABELS
    # ANY ALTERATION OF THE VALUE FOR d.value MUST MATCH d.value BELOW
    # OR DATA WILL NOT BE MATCHED WITH THE CORRECT HEIGHT
    y.domain([0, d3.max(@dataset.dataset.data, (d) ->
      return d.value / 1000
    )])

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0,#{height})")
        .call(xAxis)

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", ".71em")
        .style("text-anchor", "end")
        .text(@get('yAxisText'))

    svg.selectAll(".bar")
        .data(@dataset.dataset.data)
        .enter().append("rect")
        .attr("class", "bar")
        .attr("x", (d) ->
            return x(d.name.slice(0,2))
        )
        .attr("width", x.rangeBand())
        .attr("y", (d) ->
           return y(d.value/1000)
          )
        .attr("height", (d) ->
          return height - y(d.value/1000)
        )
        .attr("fill", (d) ->
          r = Math.floor(Math.random() * 256)
          b = Math.floor(Math.random() * 256)
          g = Math.floor(Math.random() * 256)
          "rgb( 5, #{g}, 150)"
        )

  didDestroyElement: ->
    console.log 'need to figure this out'
)

`export default SidebarGraphComponent`
