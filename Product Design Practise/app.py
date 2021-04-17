# author: Adhesh R

import dash
import dash_bootstrap_components as dbc
import dash_core_components as dcc
import dash_html_components as html
import dash_table
from dash.dependencies import Input, Output, State

import plotly.express as px
import numpy as np
import pandas as pd
import datetime

import pyodbc

# ------------------ DATABASE --------------------
server = ''
database = ''
username = ''
password = ''

driver = '{ODBC Driver 17 for SQL Server}'
conn = pyodbc.connect('DRIVER='+driver+';SERVER='+server+';PORT=1433;DATABASE='+database+';UID='+username+';PWD='+ password)

sql = "select * from camera"
df_camera = pd.read_sql(sql, conn)

sql = "select * from count"
df_count = pd.read_sql(sql, conn)

# Split the timestampp into date and time
df_count['date'] = df_count['timestampp'].astype(str).apply(lambda x: x.split(" ")[0])
df_count['time'] = df_count['timestampp'].astype(str).apply(lambda x:x.split(" ")[1])
df_count['date'] = df_count['date'].apply(lambda x: datetime.datetime.strptime(x,"%Y-%m-%d"))

# Get all the indicators from the dataframe
camera_count = df_camera.shape[0]
active_cameras = df_camera[df_camera['status'] == 1].shape[0]
records_count = df_count.shape[0]

df_count.to_csv('counter.csv',index = False, header=  True)

# -------------------  Styling -----------------------------
CONTENT_STYLE = {
    'margin-left': '5px',
    'margin-right': '5px',
    'padding': '20px 10p',
    'background-color' : '#f7f7f7',
}

HEADER_STYLE = {
    'background-color':'#05538f'
    #'padding':'20px'    
}

HEADER_TEXT_STYLE = {
    'color': '#e0eff0',
    'padding' : '10px 0px 0px 20px ',
    'font-size' : '40px',
    'font-weight' : 'bold'
}

SUB_HEADER_TEXT_STYLE = {
    'color': '#e0eff0',
    'padding' : '0px 0px 10px 20px ',
    'font-family': 'sans-serif'
}

CARD_HEADER_TEXT_STYLE = {
    #'textAlign': 'center',
    'color': '#15b99a',
    'padding' : '0px 0px 0px 10px',
    'font-size' : '26px',
    'font-family': 'emoji'
}

CARD_KPI_TEXT_STYLE = {
    #'textAlign': 'center',
    'color': '#15b99a',
    'padding' : '0px 0px 0px 10px',
    'font-size' : '36px',
    'font-family': 'sans-serif',
    'font-weight': 'bolder'
}

TITLE_TEXT_STYLE = {
    'textAlign': 'center',
    'color': '#0074D9',
    'padding' : '20px',
    #'font-family': '"Goudy Bookletter 1911", sans-serif'
}

KPI_STYLE = {
    'background-color' : '#f7f7f7',
    'margin-left': '5px',
    'margin-right': '5px',
    'padding-bottom': '30px'
}

CARD_STYLE = {
    'background-color': 'inherit',
    'border':'none',
    'border-right':'2px solid #c0c4c7',
    'border-radius': '0rem'
}

TREND_STYLE = {
    'padding':'20px'
}

TREND_CARD_STYLE = {}

CONTROL_CARD_STYLE = {
    'min-height':'490px',
}

CONTROL_TEXT_STYLE = {
    'padding': '0px 0px 10px 20px',
}

CONTROL_HEADER_STYLE = {
    'font-size' : '22px',
    'font-family': 'sans-serif',
    'font-weight': 'bolder',
    'padding': '0px 0px 10px 20px',
}

CONTROL_DATE_STYLE = {
    'padding': '0px 0px 20px 20px',
}

CONTROL_APPLY_BTN_STYLE = {
    'margin-left': '30px',
    'margin-top': '20px'
}

INSIGHT_STYLE = {
    'padding-top':'20px'
}

INSIGHT_CARD_STYLE = {
    'min-height':'300px',
}

BUSY_DATE_STYLE = {
    'float':'right',
}

DB_TABLE_STYLE = {
    'padding-top':'20px',
}

DB_CARD_STYLE = {
    'min-height':'300px',
    'max-height': '400px',
    'overflow':'scroll',
}

DB_CAM_CARD_STYLE = {
    'min-height':'300px',
}

CAMERA_TABLE_TEXT_STYLE = {
    'padding-top':'20px',
    'align-self':'center',
    'margin-bottom':'1px',
    'font-size':'18px',
    'font-weight':'bold',
}

FOOTER_STYLE = {
    'background-color':'#05538f',
    'height':'50px'
}

FOOTER_TEXT_STYLE = {
    'color': '#e0eff0',
    'padding' : '10px 0px 10px 20px ',
    'font-size' : '18px',
    'margin-top' : '20px',
    'margin-bottom' : '1px'
}

# ------------- HEADER ----------------
header_row = html.Div(
    [
        html.H2('PixCount', style=HEADER_TEXT_STYLE),
        html.H4('An Analytics Board',style = SUB_HEADER_TEXT_STYLE) 
    ], style = HEADER_STYLE)

# -------------- KPI CARDS --------------- 
card_1 = dbc.Card(
    [
       dbc.CardBody(
        [
            html.P(str(camera_count), style=CARD_KPI_TEXT_STYLE),
            html.P('Total Cameras', className='card-title', style=CARD_HEADER_TEXT_STYLE), 
        ]) 
    ], style = CARD_STYLE)

card_2 = dbc.Card(
    [
       dbc.CardBody(
        [
            html.P(str(active_cameras), style=CARD_KPI_TEXT_STYLE),
            html.P('Active Cameras', className='card-title', style=CARD_HEADER_TEXT_STYLE),
        ]) 
    ], style = CARD_STYLE)

card_3 = dbc.Card(
    [
       dbc.CardBody(
        [
            html.P('Active', style=CARD_KPI_TEXT_STYLE),
            html.P('Database Status', className='card-title', style=CARD_HEADER_TEXT_STYLE),
        ]) 
    ], style = CARD_STYLE)

card_4 = dbc.Card(
    [
       dbc.CardBody(
        [
            html.P(records_count, style=CARD_KPI_TEXT_STYLE),
            html.P('Weekly Records', className='card-title', style=CARD_HEADER_TEXT_STYLE),
        ]) 
    ], style = CARD_STYLE)

# ----------------- GRPAH with controls -----------------

# ROW - 1
KPI_row = dbc.Row(
    [
        dbc.Col(card_1,md = 3),
        dbc.Col(card_2,md = 3),
        dbc.Col(card_3,md = 3),
        dbc.Col(card_4,md = 3),
    ], style = KPI_STYLE)

# ROW - 2
controls = html.Div(
    [   
        html.Div([html.Label('Filter Parameters', style = CONTROL_HEADER_STYLE)]),
        html.Hr(),
        html.Div([html.Label('Start Date', style = CONTROL_TEXT_STYLE)]),
        html.Div([dcc.DatePickerSingle(id = 'start-date', style = CONTROL_DATE_STYLE)]),
        html.Div([html.Label('End Date', style = CONTROL_TEXT_STYLE)]),
        html.Div([dcc.DatePickerSingle(id = 'end-date',style = CONTROL_DATE_STYLE)]),
        dbc.Button('Apply',id='filter-apply',color = 'primary', style = CONTROL_APPLY_BTN_STYLE),
        dbc.Button('Show All',id='filter-all',color = 'primary', style = CONTROL_APPLY_BTN_STYLE)
    ])

trend_card = dbc.Card(
    [
        dbc.CardBody(
            [
                dcc.Graph(
                    id = 'trend-graph',
                    figure = px.line(x = df_count['timestampp'],y=df_count['total_count'],title='Count Over Time', labels={'x':'Datetime','y':'Count'})
                    )
            ])
    ],style = TREND_CARD_STYLE)

control_card = dbc.Card(
    [
        dbc.CardBody(
            [
                controls
            ])
    ],style = CONTROL_CARD_STYLE)

trend_row = dbc.Row(
    [
        dbc.Col(trend_card,md=9),
        dbc.Col(control_card,md=3)
    ],style = TREND_STYLE)

#ROW-3
busy_day_card = dbc.Card(
    [
        dbc.CardBody(
            [      
               html.Div([html.P('Weekly Analysis', style= {'float':'left', 'padding-top':'10px', 'font-size':'18px'}),dcc.DatePickerSingle(id = 'busy-date-week',style = BUSY_DATE_STYLE),],style = {'display':'flow-root'}),
               html.Hr(),
               dcc.Graph(id = 'weekly-analysis-graph')
            ])
    ],style = INSIGHT_CARD_STYLE)

busy_hr_card = dbc.Card(
    [
        dbc.CardBody(
            [
               html.Div([html.P('Daily Analysis', style= {'float':'left', 'padding-top':'10px', 'font-size':'18px'}),dcc.DatePickerSingle(id = 'busy-hr-day',style = BUSY_DATE_STYLE),],style = {'display':'flow-root'}),
               html.Hr(),
               dcc.Graph(id = 'daily-analysis-graph')
            ])
    ],style = INSIGHT_CARD_STYLE)

# ----------- Average Analysis Graph Definition ----------------------
# First select the last 7 days with complete 24 hr record
lst = df_count["date"].values
#lst = [str(x).split("T")[0] for x in lst]

# Get the hr record cnt for each date
values, counts = np.unique(lst, return_counts=True)

# Start from last and select 7 dates that have complete 24 hr records
flag = 0
i = len(values) - 1
last_seven = []
while(flag !=7):
    if counts[i]!=24:
        i-=1
        continue
    last_seven.append(values[i])
    i -= 1
    flag += 1

df_avg = df_count[df_count["date"].isin(last_seven)]
df_avg = df_avg.groupby(["time"])["total_count"].mean()

# Plot the graph
avg_fig = px.line(df_avg, x = df_avg.index,y="total_count",labels={"total_count":"Total Count","time":"Time"}, title = "Count on a Typical Day")
avg_fig.add_bar(x = df_avg.index,y=df_avg.values,name="Average count")

average_day_card = dbc.Card(
    [
        dbc.CardBody(
            [
               html.P('Typical Day',style = {'font-size':'18px'}),
               html.P('Based on average activity over the last seven days',style = {'font-size':'14px'}),
               html.Hr(),
               dcc.Graph(id = 'typical-day-graph', figure = avg_fig)
            ])
    ],style = INSIGHT_CARD_STYLE)


insights_row = dbc.Row(
    [
        dbc.Col(busy_day_card,md = 4),
        dbc.Col(busy_hr_card,md = 4),
        dbc.Col(average_day_card,md=4, style= {'flex':'0 0 32.5%','max_width':'32.5%'})
    ],style = INSIGHT_STYLE)

# ROW - 4
camera_cols = ["CamID","Location","Status"]
df_camera["staus"] = df_camera["status"] = np.where(df_camera["status"] == 1, "Active", "Not Active")

camera_table_card = dbc.Card(
    [
        html.P('Camera Table', style = CAMERA_TABLE_TEXT_STYLE),
        html.Hr(),
        dbc.CardBody(
            [
                dash_table.DataTable(
                    id='camera-table',
                    columns = [{"name":i, "id":j} for i,j in zip(camera_cols,df_camera.columns)],
                    data = df_camera.to_dict('records'),
                    style_as_list_view=True,
                    style_header={
                        'backgroundColor': 'white',
                        'fontWeight': 'bold',
                        'textAlign': 'left'
                    },
                    style_cell = {
                        'padding': '5px',
                        'textAlign': 'left',
                    },
                    style_data_conditional=[
                    {
                        'if': {'row_index': 'odd'},
                        'backgroundColor': 'rgb(248, 248, 248)'
                    }
                    ],
                    )
            ]),
        html.Hr(style = {'margin-left':'10px','margin-right':'10px'}),
        html.P('Number of Records: '+str(len(df_camera)),style = {'padding-left':'15px','font-size':'14px'})
    ],style = DB_CAM_CARD_STYLE)

count_cols = ["ID","Timestamp","Count","CamID"]
count_cols_id = ['id','timestampp','total_count','camid']
df_count_cp = df_count.copy()
df_count_cp['timestampp'] = df_count_cp['timestampp'].astype('str')
count_table_card = dbc.Card(
    [
        html.P('Count Table', style = CAMERA_TABLE_TEXT_STYLE),
        html.Hr(),
        dbc.CardBody(
            [
                dash_table.DataTable(
                    id='count-table',
                    columns = [{"name":i, "id":j} for i,j in zip(count_cols,count_cols_id)],
                    data = df_count_cp[['id','timestampp','total_count','camid']].to_dict('records'),
                    style_as_list_view=True,
                    style_header={
                        'backgroundColor': 'white',
                        'fontWeight': 'bold',
                        'textAlign': 'left'
                    },
                    style_cell = {
                        'padding': '5px',
                        'textAlign': 'left',
                    },
                    style_data_conditional=[
                    {
                        'if': {'row_index': 'odd'},
                        'backgroundColor': 'rgb(248, 248, 248)'
                    }
                    ],
                    )
            ]),
        #html.Hr(style = {'margin-left':'10px','margin-right':'10px'}),
        #html.P('Number of Records: '+str(len(df_count)),style = {'padding-left':'15px','font-size':'14px'})
    ],style = DB_CARD_STYLE)

db_table_row = dbc.Row(
    [
        dbc.Col(camera_table_card,md = 4),
        dbc.Col(count_table_card,md=8,style= {'flex':'0 0 65.7%','max_width':'65.7%'})
    ], style = DB_TABLE_STYLE
    )

# ------------- FOOTER ----------------
footer_row = html.Div(
    [
        html.P('Created By B1-17', style=FOOTER_TEXT_STYLE),
    ], style = FOOTER_STYLE)

content = html.Div(
    [
        header_row,
        KPI_row,
        trend_row,
        insights_row,
        db_table_row,
        footer_row
    ],
    style=CONTENT_STYLE
)

app = dash.Dash(external_stylesheets=[dbc.themes.BOOTSTRAP,"styles.css"])
app.layout = html.Div(content)

# Application callbacks
@app.callback(
    Output("trend-graph", "figure"),
    [
    Input(component_id="filter-apply", component_property="n_clicks"),
    Input(component_id="filter-all", component_property="n_clicks"),
    Input(component_id="start-date", component_property="date"),
    Input(component_id="end-date", component_property="date")
    ],
)
def update_graph(n_clicks,n_clicks_1, start_date, end_date):

    changed_ids = [p['prop_id'].split('.')[0] for p in dash.callback_context.triggered]
    button_pressed_apply = 'filter-apply' in changed_ids
    button_pressed_all = 'filter-all' in changed_ids

    if button_pressed_apply:
        #print(start_date)
        #print(end_date)
        start_year,start_month,start_day = str(start_date).split("-")
        end_year,end_month,end_day = str(end_date).split("-")

        sd = datetime.datetime(int(start_year),int(start_month),int(start_day))
        ed = datetime.datetime(int(end_year),int(end_month),int(end_day))
        
        df_select = df_count[np.logical_and(df_count['date'] >= sd, df_count['date'] <= ed)]
        #print(df_select)

        if len(df_select) > 0:
            trend_figure = px.line(df_select,x="timestampp",y="total_count",labels ={"timestampp":"Datetime","total_count":"Count"},title = "Count Over Time")
        else:
            return {}

    elif button_pressed_all:
        trend_figure = px.line(df_count,x="timestampp",y="total_count",labels ={"timestampp":"Datetime","total_count":"Count"},title = "Count Over Time")
    else:
        return dash.no_update
        #print(n_clicks)
    
    return trend_figure


# Define the callback function for weekly analysis graph
@app.callback(
        Output("weekly-analysis-graph", "figure"),
        Input(component_id="busy-date-week", component_property="date"),
    )
def update_week_graph(week_date):
    
    if week_date is None:
        return {}

    # Extract date
    yr,month,day = str(week_date).split("-")
    dt = datetime.datetime(int(yr),int(month),int(day))
    #print(dt)

    # Get the week dates
    start = dt - datetime.timedelta(days=dt.weekday())
    end = start + datetime.timedelta(days=6)
    #print(start,end)

    start_str = start.strftime("%d-%m-%Y")
    end_str = end.strftime("%d-%m-%Y")

    # Get selection
    df_week = df_count[np.logical_and(df_count['timestampp'] >= start,df_count['timestampp'] <= end)]

    lst = []
    for i in range(7):
        lst.append(df_week[i:i+24]["total_count"].values)
    time = df_week[:24]["time"].values

    fig = px.imshow(lst,labels=dict(x="Time", y="Day of the Week", color="Count"),
                y=['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday','Saturday','Sunday'],
                x=time, title = 'Week: '+str(start_str)+' to '+str(end_str))

    return fig

# Define callback function for daily analysis graph
@app.callback(
        Output("daily-analysis-graph", "figure"),
        Input(component_id="busy-hr-day", component_property="date")
    )
def update_daily_graph(day_date):

    if day_date is None:
        return {}

    # Extract date
    yr,month,day = str(day_date).split("-")
    dt = datetime.datetime(int(yr),int(month),int(day))
    dt_str = dt.strftime("%d-%m-%Y")
    print(dt)

    # Get selection
    df_day = df_count[df_count['date'] == dt]

    fig = px.pie(df_day, values="total_count",names="time",title=dt_str)

    return fig

if __name__ == '__main__':
    app.run_server(port='8085')
