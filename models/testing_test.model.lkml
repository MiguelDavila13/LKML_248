connection: "thelook_mysql"

include: "/views/**/*.view.lkml"                # include all views in the views/ folder in this project
#include: "/views/**/*.lkml"                     # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: users {}
