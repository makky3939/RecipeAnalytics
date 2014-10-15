@users_relation = ->
  d3.json 'users_relation_json', (error, data) ->
    console.log data
    nodes = {}

    data.forEach (link) ->
      link.source = nodes[link.source] || (nodes[link.source] = {name: link.source})
      link.target = nodes[link.target] || (nodes[link.target] = {name: link.target})
      0

    # console.log data
    # console.log nodes
    width = $('h2').width()*1.6
    height = $('h2').width()

    force = d3.layout.force()
      .nodes(d3.values(nodes))
      .links(data)
      .size([width, height])
      .linkDistance(60)
      .charge(-200)
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
        # .on("mouseover", ->
        #   d3.select(this).select("circle").transition()
        #     .duration(250)
        #     .attr("r", 24)
        # )
        # .on("mouseout", ->
        #   d3.select(this).select("circle").transition()
        #     .duration(250)
        #     .attr("r", 16)
        # )
        # .call(force.drag)

    node.append("circle")
      .attr "r", (d) ->
        switch d.weight
          when 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
            return 0
          else
            return 16

      .attr "fill", (d) ->
        if d.weight < 9
          return "#03C9A9"
        else if d.weight > 9 && d.weight <= 100
          return "#4183D7"
        else if d.weight > 100 && d.weight <= 200
          return "#F89406"
        else
          return "#F64747"

    # node.append("text")
    #   .attr("x", 12)
    #   .attr("dy", ".35em")
    #   .text (d) ->
    #     return d.name

    node.append("text")
      .attr('fill', '#ffffff')
      .attr("x", 0)
      .attr("dy", 0)
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