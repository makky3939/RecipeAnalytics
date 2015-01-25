@users_relation = ->
  d3.json '/analyse/report/user_relation_json', (error, data) ->
    console.log data
    nodes = {}

    data.forEach (link) ->
      link.source = nodes[link.source] || (nodes[link.source] = {name: link.source})
      link.target = nodes[link.target] || (nodes[link.target] = {name: link.target})
      0

    width = $('h2').width()
    height = $('h2').width()

    force = d3.layout.force()
      .nodes(d3.values(nodes))
      .links(data)
      .size([width, height])
      .linkDistance(512)
      .charge(-100)
      .friction(0)
      .start()
    svg = d3.select("#users_relation").append("svg")
      .attr("width", width)
      .attr("height", height)

    link =
      svg.selectAll(".link")
        .data(force.links())
      .enter().append("line")
        .attr("class", "link")

    node =
      svg.selectAll(".node")
        .data(force.nodes())
      .enter().append("g")
        .attr("class", "node")
        .call(force.drag)

    node.append("circle")
      .attr "r", (d) ->
        if d.weight < 9
          return 8
        else
          return d.weight * 0.8

      .attr "fill", (d) ->
        if d.weight < 9
          return "#5c5757"
        else if d.weight > 9 && d.weight <= 100
          return "#53a1b8"
        else if d.weight > 100 && d.weight <= 200
          return "#237dac"
        else
          return "#4f5f6f"

    node.append("text")
      .attr('fill', '#565656')
      .style("text-anchor", "middle")
      .attr("dy", "1.6em")
      .text (d) ->
        return d.name if d.weight > 10

    node.append("text")
      .attr('fill', '#ffffff')
      .style("text-anchor", "middle")
      .attr("dy", '.3em')
      .text (d) ->
        return d.weight

    force.on "tick", ->
      link
        .attr "x1", (d) ->
          return d.source.x
        .attr "y1", (d) ->
          return d.source.y
        .attr "x2", (d) ->
          return d.target.x
        .attr "y2", (d) ->
          return d.target.y
      node
        .attr("transform", (d) -> return "translate(" + d.x + "," + d.y + ")" )
      0
    0
  0