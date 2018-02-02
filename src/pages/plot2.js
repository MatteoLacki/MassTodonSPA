/*global Bokeh */
/*eslint no-undef: "error"*/


var plt = Bokeh.Plotting;

var bar_data = [
    ['City', '2010 Population', '2000 Population'],
    ['New York City, NY', 8175000, 8008000],
    ['Los Angeles, CA', 3792000, 3694000],
    ['Chicago, IL', 2695000, 2896000],
    ['Houston, TX', 2099000, 1953000],
    ['Philadelphia, PA', 1526000, 1517000],
];

var p1 = Bokeh.Charts.bar(bar_data, {
    axis_number_format: "0.[00]a"
});
var p2 = Bokeh.Charts.bar(bar_data, {
    axis_number_format: "0.[00]a",
    stacked: true
});
var p3 = Bokeh.Charts.bar(bar_data, {
    axis_number_format: "0.[00]a",
    orientation: "vertical"
});
var p4 = Bokeh.Charts.bar(bar_data, {
    axis_number_format: "0.[00]a",
    orientation: "vertical",
    stacked: true
});

plt.show(plt.gridplot([p1, p2, p3, p4]));

export default plt
