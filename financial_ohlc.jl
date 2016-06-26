#using Dates
using DataFrames
file = "/home/main/Python/note/GBPJPY1.csv"
my_names = ["Date","Time","open","high","Low", "close","Volume"]


f_open = readcsv(file)


df = DataFrame(f_open)

names!(df.colindex,map(parse,my_names))
using Immerse

data_size=df[:Time][end-2000:end-1]
Gadfly.set_default_plot_size(25cm, 21cm)
Theme(minor_label_font_size=6pt)
plot(x=data_size,y=df[:close][end-2000:end-1],Geom.pointGeometry,
Guide.xlabel("time"),
Guide.xticks(ticks=[1:1:length(data_size)],orientation=:vertical)
)

