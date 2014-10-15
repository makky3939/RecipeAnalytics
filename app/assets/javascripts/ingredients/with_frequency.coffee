@with_frequency = ->
  width = $('h2').width()
  height = $('h2').width()
 
  force =
    d3.layout.force()
      .gravity 0.1
      .charge((d, i) -> d.size * -1 )
      .size [width, height]
 
  color = d3.scale.category10()
  
  svg = d3.select("#with_frequency")
    .append "svg"
    .attr "width", width
    .attr "height", height
    .append "g"
      .attr "transform", "translate(" + 0 + "," + 0 + ")"
  
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
        if d.size <= 100
          return "#27ae600"
        else if d.size > 100 && d.size <= 300
          return "#e67e22"
        else if d.size > 500 && d.size <= 700
          return "#03C9A9"
        else
          return "#c0392b"

    node.append("text")
      .text((d) -> return d.name)
        .attr('fill', '#efefef')
        .attr('font-size', 6)
        .attr('dx', 0)
        .attr('dy', -5)
        .attr('text-anchor', 'middle')
        .attr('class', 'item-name')

    node.append("text")
      .text((d) -> return d.size)
      .attr('fill', '#bcbcbc')
      .attr('font-size', 3)
      .attr('dx', 0)
      .attr('text-anchor', 'middle')
      .attr('dy', 5)

    force.on "tick", ->
      node
        .attr('transform', (d) -> return 'translate('+ Math.max(20, Math.min(width-20, d.x)) + ',' + Math.max(20, Math.min(height-20, d.y)) + ')')
        false
      false
  0