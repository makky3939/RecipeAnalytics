@method_of_ingredients = ->
  d3.json '/analyse/method/of_ingredients_json', (error, data) ->
    nodes = {}

    data.forEach (link) ->
      link.source = nodes[link.source] || (nodes[link.source] = {name: link.source})
      link.target = nodes[link.target] || (nodes[link.target] = {name: link.target})
      0

    console.log nodes

    width = $('h2').width()*2
    height = $('h2').width()*2

    force = d3.layout.force()
      .nodes(d3.values(nodes))
      .links(data)
      .size([width, height])
      .linkDistance (d) ->
        return 90
      .friction(0)
      .gravity(0)
      .start()
    svg = d3.select("#method_of_ingredients").append("svg")
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

    node.append("circle")
      .attr "r", (d) ->
        if d.weight < 9
          return 0
        else
          if d.weight > 300
            return 100
          else
            return d.weight * 0.3

      .attr "fill", (d) ->
        if d.name.match(/動詞/)
          return "#237dac"
        else
          return "#5c5757"

    node.append("text")
      .attr('fill', '#aaaaaa')
      .style("text-anchor", "middle")
      .attr("dy", "1.6em")
      .text (d) ->
        if d.name.match(/動詞/)
          return d.name
        else
          return d.name

    node.append("text")
      .attr('fill', '#ffffff')
      .style("text-anchor", "middle")
      .attr("dy", '.3em')
      .text (d) ->
        return d.weight

    node.call(force.drag)

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