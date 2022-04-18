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
import plotly.figure_factory as ff


#----------------------Data Imports-----------------------------

stadiumMap = pd.read_csv('https://raw.githubusercontent.com/rodrigomfguedes/datavisualization/master/Data_dash/stadiumMap.csv')
games_df = pd.read_csv('https://raw.githubusercontent.com/rodrigomfguedes/datavisualization/master/Data_dash/games_df.csv')
round6_stats_df = pd.read_csv('https://raw.githubusercontent.com/rodrigomfguedes/datavisualization/master/Data_dash/round6_stats_df.csv')


group_names = ['A','B','C','D','E','F','G','H']

drop_group = dcc.Dropdown(id='drop_group',
                              clearable=False,
                              searchable=False,
                              options=[{'label': 'Group A', 'value': 'A'},
                                       {'label': 'Group B', 'value': 'B'},
                                       {'label': 'Group C', 'value': 'C'},
                                       {'label': 'Group D', 'value': 'D'},
                                       {'label': 'Group E', 'value': 'E'},
                                       {'label': 'Group F', 'value': 'F'},
                                       {'label': 'Group G', 'value': 'G'},
                                       {'label': 'Group H', 'value': 'H'}],
                              value='A',
                              style={'margin': '4px', 'box-shadow': '0px 0px #ebb36a', 'border-color': '#ebb36a'}
                              )

drop_statistic = dcc.Dropdown(id='drop_statistic',
                              clearable=False,
                              searchable=False,
                              options=[{'label': 'Ball Posession', 'value': 'ballPosession'},
                                       {'label': 'Shots on Goal', 'value': 'shotsOnGoal'},
                                       {'label': 'Corners', 'value': 'corners'},
                                       ],
                              value='ballPosession',
                              style={'margin': '4px', 'box-shadow': '0px 0px #ebb36a', 'border-color': '#ebb36a'}
                              )


slider_round = daq.Slider(id='slider_round',
                        handleLabel={"showCurrentValue": True,"label": "Round"},
                        marks = {str(i):str(i) for i in [1,2,3,4,5,6]},
                        min =1,
                        max =6,
                        size=450,
                        color='#4B9072',
                        value = 1
                        )



######################################################Interactive Components############################################


#-------------------Static Visualizations----------------------

#################################### STADIUMS MAPS ########################################

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

#################################### STADIUMS MAPS ########################################

scatter_corr = dict(type='scatter',
                    x=round6_stats_df['matchPoints'],
                    y=round6_stats_df['shotsOnGoal'],
                    mode='markers',
                    marker=dict(size=round6_stats_df['corners'] * 3,
                                color=round6_stats_df['ballPosession'],
                                colorbar=dict(title=dict(text='Average Ball Posession <br> Percentage')),
                                colorscale=["#000066", '#f9fbff'],
                                showscale=True,
                                line=dict(width=1, color='rgba(102, 102, 102)'),
                                reversescale=True,
                                autocolorscale=False,
                                cmin=0,
                                opacity=0.8, ),

                    text="Team Name: " + round6_stats_df['team_name'].astype(str) +
                         "<br>Final Match Points: " + round6_stats_df['matchPoints'].astype(str) +
                         "<br>Number of Shots on Goal: " + round6_stats_df['shotsOnGoal'].astype(str) +
                         "<br>Number of Free Kicks: " + round6_stats_df['corners'].astype(str) +
                         "<br>Ball Posession Percentage: " + round6_stats_df['ballPosession'].astype(str),
                    hoverinfo="text",
                    name='Scatter Visualization',
                    showlegend=False)

layout_scatter_corr = dict(title=dict(text='Relation between the Total Points ', x=0),
                           yaxis=dict(title='Average Number of Shots on Goal', showgrid=False),
                           xaxis=dict(title='Final Match Points', showgrid=False),
                           margin=dict(l=0,
                                       r=0,
                                       b=0,
                                       t=30,
                                       pad=0),
                           paper_bgcolor='rgba(0,0,0,0)',
                           plot_bgcolor='#f9fbff')

fig_scatter_corr = go.Figure(data=scatter_corr, layout=layout_scatter_corr)


def blank_fig():
    fig = go.Figure(go.Scatter(x=[], y=[]))
    fig.update_layout(template=None)
    fig.update_xaxes(showgrid=False, showticklabels=False, zeroline=False)
    fig.update_yaxes(showgrid=False, showticklabels=False, zeroline=False)

    return fig

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
    ], className='side_bar'),

    html.Div([
        html.Div([
                html.Div([
                    html.Div([
                        dcc.Graph(figure=fig_map_scattergeo),
                        html.Div([
                        html.P('Understand what is the region of the Europe that have more represents in the competition and check for each Team the information regarding the Capacity of the Stadium by the size of the stars and the number of Champions League titles won by the color saturation of the markers.')
                        ], className='box_comment')
                    ], className='box', style={'padding-bottom':'15px'})

                ], style={'width': '100%'})

        ], className='row'),

        html.Div([
                html.Div([
                    html.Div([
                        dcc.Graph(figure=fig_scatter_corr),
                        html.Div([
                        html.P('Analyse the relationships between the number of points of the teams in the end of the Group Stage and the different statistics characteristics of a Football Game. The size of the markers represent the average number of corners and the color saturation the average ball possession %')
                        ], className='box_comment')
                    ], className='box', style={'padding-bottom':'15px'})

                ], style={'width': '100%'})

        ], className='row'),


        html.Div([
            html.Div([
                html.Div([
                        html.Div([
                            html.Div([
                                drop_group,
                                html.Br(),
                            ],style={'margin-left': '5%','width':'25%'}),

                            html.Div([
                                drop_statistic,
                                html.Br(),
                                html.Br(),
                            ], style={'margin-left': '35%','width':'25%'}),

                        ], className='row'),

                        html.Div([

                        dcc.Graph(id='table_stat')
                        ],style={'width': '90%'}),


                        html.Div([
                            html.Div([
                                slider_round
                            ], style={'margin-left': '25%', 'width': '50%'})
                        ], className='row')
                ], )
            ], className='box', style={'width': '100%'})
        ], className='row'),
    ], className='main')
])

##########################PLOT TABLES and Statistics #################################
@app.callback(

        Output('table_stat','figure'),
        Input("slider_round", "value"),
        Input("drop_group", "value"),
        Input("drop_statistic", "value")
)



def group_table(gameround, group, statistic):
    # Get the round stats
    print(gameround, group, statistic)
    c1 = games_df[games_df['round'] <= gameround].groupby(['Teams_teamID', 'team_name', 'GroupName'])[
        ['matchPoints', 'score']].sum()
    c2 = games_df[games_df['round'] <= gameround].groupby(['Teams_teamID', 'team_name', 'GroupName'])[
        ['ballPosession', 'corners', 'shotsOnGoal']].mean().round(1)

    round_stats_df = c1.merge(c2, on=['Teams_teamID', 'team_name', 'GroupName'])
    round_stats_df.reset_index(inplace=True)

    # Get the group stats
    group_df = round_stats_df[round_stats_df['GroupName'] == group][
        ['team_name', 'score', 'matchPoints', 'ballPosession', 'corners', 'shotsOnGoal']].sort_values(by='matchPoints',
                                                                                                      ascending=False)
    table_stats = ['team_name', 'matchPoints', 'score']
    bar_stats = ['ballPosession', 'corners', 'shotsOnGoal']

    # List for the table
    table_list = group_df[table_stats].values.tolist()
    table_list = np.vstack((['1st', '2nd', '3rd', '4th'], np.array(table_list).T)).T.tolist()

    # List for barplot
    bar_list = group_df[statistic].values.tolist()

    # Add table data
    table_data = [['Position', 'Team', 'Points', 'Goals Scored']] + table_list

    # Initialize a fig with ff.create_table(table_data)
    colorscale = [[0, '#000066'], [.5, '#cccce0'], [1, '#ffffff']]
    fig = ff.create_table(table_data, height_constant=60, colorscale = colorscale)

    # Add graph data
    teams = np.array(table_list)[:, 1].tolist()

    GFPG = bar_list

    fig.add_trace(go.Bar(x=teams, y=GFPG, xaxis='x2', yaxis='y2',
                         marker=dict(color="#000066"),
                         name='Average ' + statistic + ' Per Game'))

    fig.update_layout(
        title_text='Group Stats',
        height=400,
        margin={'t': 75, 'l': 50},
        xaxis={'domain': [0, .52]},
        yaxis2={'anchor': 'x2', 'title': statistic + ' average'},
        xaxis2={'domain': [.6, 1], 'anchor': 'x2'}
    )

    return fig


# ------------------------------------------------------ Callbacks ------------------------------------------------------


if __name__ == '__main__':
    app.run_server(debug=True)
