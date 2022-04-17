import dash
from dash import dcc
from dash import html
from dash.dependencies import Input, Output, State
import dash_daq as daq
import dash_bootstrap_components as dbc
import numpy as np
import pandas as pd
import plotly.graph_objs as go
import plotly.express as px


#----------------------Data Imports-----------------------------

stadiumMap = pd.read_csv('https://raw.githubusercontent.com/rodrigomfguedes/datavisualization/master/Data/stadiumMap.csv')
games_df = pd.read_csv('https://raw.githubusercontent.com/rodrigomfguedes/datavisualization/master/Data/games_df.csv')
round6_stats_df = pd.read_csv('https://raw.githubusercontent.com/rodrigomfguedes/datavisualization/master/Data/games_df.csv')


group_names = ['A','B','C','D','E','F','G','H']



######################################################Interactive Components############################################

group_options = [dict(label=group, value=group) for group in group_names]

slider_year = dcc.Slider(
        id='year_slider',
        min=games_df['round'].min(),
        max=games_df['round'].max(),
        marks={str(i): '{}'.format(str(i)) for i in
               [1,2,3,4,5,6]},
        value=games_df['round'].min(),
        step=1
    )

#-------------------Visualizations----------------------





# ------------------------------------------------------ APP ------------------------------------------------------

app = dash.Dash(__name__)

server = app.server

app.layout = html.Div([

    html.Div([
        html.Img(src=app.get_asset_url('UEFA_Champions_League_logo.png'),
                 style={'position': 'relative', 'width': '100%', 'left': '2px', 'top': '15px',
                        'margin-bottom': '30px'}),

        html.Label(
            'The UEFA Champions League is an annual continental football club competition organized by the Union of European Football Associations and contested by European clubs. And our purpose was to build an itereactive Dashboard of the 66th edition of the UEFA Champions League, 2020-2021.',
            style={'color': '#363535', 'text-align': 'justify', 'margin-bottom': '15px'}),

        html.P(['Group 15', html.Br(), 'Beatriz Gomes - 20210545', html.Br(), 'Catarina Garcez - 20210547', html.Br(),
                'Diogo Pires - 20201076', html.Br(), 'Rodrigo Guedes - 20210587'], style={'font-size': '14px'})
    ], className='side_bar')
])


map_scattergeo = dict(type='scattergeo',
                      lat=stadiumMap['Latitude'],
                      lon=stadiumMap['Longitude'],

                      mode='markers',

                      text="Team Name: " + stadiumMap["team_name"].astype(str) +
                           "<br>Stadium Name: " + stadiumMap["StadiumName"].astype(str) +
                           "<br>City: " + stadiumMap['CityName'].astype(str) +
                           "<br>Coutry: " + stadiumMap['CoutryInitials'].astype(str) +
                           "<br>Stadium's Capacity: " + stadiumMap['Capacity'].astype(str) +
                           "<br>Total Trophies: " + stadiumMap['totaltrophies'].astype(str),

                      hoverinfo="text",

                      marker=dict(size=stadiumMap['Capacity'] / 4000,
                                  opacity=0.8,
                                  reversescale=True,
                                  autocolorscale=False,
                                  symbol='star',
                                  line=dict(width=1, color='rgba(102, 102, 102)'),
                                  colorscale=['#f9fbff', "#8e7cc3"],
                                  cmin=0,
                                  color=stadiumMap['totaltrophies'],
                                  colorbar_title="Number of Champions League Titles"
                                  )
                      )

map_layout_scattergeo = dict(geo=dict(scope='europe',
                                      projection={'type': 'natural earth'},
                                      bgcolor='rgba(0,0,0,0)',
                                      landcolor='#000066'),
                             title=dict(text="Map - Location of each Club's Stadiumns", x=0),
                             margin=dict(l=0,
                                         r=0,
                                         b=0,
                                         t=30,
                                         pad=0),
                             paper_bgcolor='rgba(0,0,0,0)',
                             plot_bgcolor='#000066')

fig_map_scattergeo = go.Figure(data=map_scattergeo, layout=map_layout_scattergeo)
fig_map_scattergeo.update_geos(showcoastlines=False, showsubunits=False, showframe=False)

#html.Div([

dcc.Graph(figure=fig_map_scattergeo)

 #   ])





# ------------------------------------------------------ Callbacks ------------------------------------------------------


if __name__ == '__main__':
    app.run_server(debug=True)
