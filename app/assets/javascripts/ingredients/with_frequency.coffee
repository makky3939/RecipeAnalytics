@with_frequency = ->
  margin =
    top: 0
    right: 0
    bottom: 0
    left: 0

  width = $('h2').width() - margin.left - margin.right
  height = $('h2').width() - margin.top - margin.bottom
 
  force =
    d3.layout.force()
      .gravity 0.1
      .charge((d, i) -> d.size * -1 )
      .size [width, height]
 
  color = d3.scale.category10()
  
  svg = d3.select("#with_frequency")
    .append "svg"
    .attr "width", width + margin.left + margin.right
    .attr "height", height + margin.top + margin.bottom
    .append "g"
      .attr "transform", "translate(" + margin.left + "," + margin.top + ")"
  
  d3.json 'with_frequency_json', (error, data) ->
    console.table data.values
    data.values.forEach (d) ->
      d.name = d[0]
      d.size = d[1]
      false
    false

    force
      .nodes(data.values)
      .start()
      false
        
    node =
      svg.selectAll("g.node")
        .data(data.values)
        .enter()
        .append("g")
          .attr("class", "node")
          .call(force.drag)

    node.append("circle")
      .attr("r", (d) -> d.size * .1)
      .attr("opacity", 1)
      .attr('class', 'item')
      .attr "fill", (d) ->
        if d.size <= 80
          return "#27ae60"
        else if d.size > 80 && d.size <= 90
          return "#f1c40f"
        else if d.size > 90 && d.size <= 100
          return "#e67e22"
        else
          return "#c0392b"

    node.append("text")
      .text((d) -> return d.name)
        .attr('fill', '#acacac')
        .attr('font-size', 3)
        .attr('dx', -5)
        .attr('dy', -5)
        .attr('class', 'item-name')

    node.append("text")
      .text((d) -> return d.size / 10 )
      .attr('fill', '#fff')
      .attr('font-size', 4)
      .attr('dx', -2)
      .attr('dy', 1)

    force.on "tick", ->
      node
        .attr('transform', (d) -> return 'translate('+ Math.max(20, Math.min(width-20, d.x)) + ',' + Math.max(20, Math.min(height-20, d.y)) + ')')
        false
      false
  0
# @par_count = ->
#   values =
#     d3.range 1000
#       .map d3.random.bates 10

#   formatCount =
#     d3.format ',.0f'

#   margin =
#     top: 10
#     right: 30
#     bottom: 30
#     left: 30

#   width =
#     960 - margin.left - margin.right

#   height =
#     500 - margin.top - margin.bottom

#   x =
#     d3.scale.linear()
#       .domain [0, 1]
#       .range [0, width]

#   data =
#     d3.layout.histogram().bins(x.ticks(20))(values)

#   y =
#     d3.scale.linear()
#       .domain [0, d3.max(data, (d)-> d.y)]
#       .range [height, 0]

#   xAxis =
#     d3.svg.axis()
#       .scale x
#       .orient 'bottom'

#   svg =
#     d3.select("#par_count").append('svg')
#       .attr 'width', parseInt(width + margin.left + margin.right)
#       .attr 'height', parseInt(height + margin.top + margin.bottom)
#       .append 'g'
#         .attr 'transform', 'translate(' + margin.left + ',' + margin.top + ')'

#   bar =
#     svg.selectAll '.bar'
#       .data data
#     .enter().append 'g'
#       .attr 'class', 'bar'
#       .attr 'transform', (d) -> 'translate(' + x(d.x) + ',' + y(d.y) + ')'

#   bar.append 'rect'
#     .attr 'x', 1
#     .attr 'width', x(data[0].dx) - 1
#     .attr 'height', (d) -> height - y(d.y)

#   bar.append 'text'
#     .attr 'dy', '.75em'
#     .attr 'y', -10
#     .attr 'x', x(data[0].dx) / 2
#     .attr 'text-anchor', 'middle'
#     .text (d) -> formatCount(d.y)

#   svg.append 'g'
#     .attr 'class', 'x axis'
#     .attr 'transform', 'translate(0,' + height + ')'
#     .call xAxis

#   return 0