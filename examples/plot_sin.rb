$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "svggraph"

options = {
  show_data_values: false,
  min_y_value: -1.5,
  max_y_value: -1.5,
  scale_y_divisions: 0.5,
  x_axis_position: 0
}

g = SVG::Graph::Plot.new(options)

data_points = []
data_lines = []

rad = 0
while rad < Math::PI * 2
  data_points << [rad, Math.sin(rad) + rand - 0.5]
  data_lines << [rad, Math.sin(rad)]
  rad += 0.1
end

g.add_data(
  data: data_points,
  title: "points",
  show_lines: false
)
g.add_data(
  data: data_lines,
  title: "lines",
  show_lines: true,
  show_data_points: false
)

svg = g.burn

output_filename = File.basename(__FILE__, ".rb")

File.open(File.expand_path("#{output_filename}.svg",__dir__), 'w') {|f|
  f.write(g.burn_svg_only)
}
