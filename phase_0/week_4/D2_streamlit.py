import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

st.title('My Web App')
st.image('header.jpg')
st.write('string')

chart_data = pd.DataFrame(np.random.randn(10, 4), columns=['A', 'B', 'C', 'D'])
#st.table(pd.DataFrame(np.random.randn(10, 4), columns=['A', 'B', 'C', 'D']))

chart_data

st.header('Map plotting')
map_data = pd.DataFrame(
    np.random.randn(1000, 2) / [50, 50] + [37.76, -122.4],
    columns=['lat', 'lon'])

st.map(map_data)

st.subheader('This is a button')
st.button('hey') # ini irreversible. sekali diklik, buttonnya tidak bisa diklik lagi

st.header('Checkbox :')
if st.checkbox('Show dataframe'):
    chart_data = pd.DataFrame(
       np.random.randn(20, 3),
       columns=['a', 'b', 'c'])

    chart_data

st.header('This is a radio button')
radio_select = st.radio('Which one? ', ('A', 'B', 'C'), 1)
if radio_select == 'A':
    st.write('You selected A')
elif radio_select == 'B':
    st.write('You selected B')
else:
    st.write('You selected C')


st.header('This is a Selectbox')
select_box = st.selectbox(label='Choose one O wise one :', options=('Aaa', 'Bbb', 'Ccc'), index=2)

st.header('This is a Multi Select')
multi_select = st.multiselect(label='Pick one or more :', options=('a1a1', 'B2b2', 'C2c2'))  # outputnya berbentuk list
st.write(multi_select)

st.header('This is a slider')
slider_value = st.slider('Select a range', min_value=0, max_value=50)
slider_value2 = st.slider('Select range 2', 0, 100, (25, 75))

st.header('This is a range select')
start_color, end_color = st.select_slider(
    'Select a range of color wavelength',
    options=['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'],
    value=('red', 'blue'))
st.write('You selected wavelengths between', start_color, 'and', end_color)

st.header('This is date input')
tanggal = st.date_input(label='Input the date')

st.write('The date is :', tanggal)

### text and number

st.header('This is a text input')
title = st.text_input('Movie title', 'Life of Brian')
st.write('The current movie title is', title)

st.header('This is a number input')
number = st.number_input('Insert a number')
st.write('The current number is ', number)

txt = st.text_area('Text to analyze', '''
    It was the best of times, it was the worst of times, it was
    the age of wisdom, it was the age of foolishness, it was
    the epoch of belief, it was the epoch of incredulity, it
    was the season of Light, it was the season of Darkness, it
    was the spring of hope, it was the winter of despair, (
    ''')
st.write(txt)

##### bikin SIDEBAR #####
st.sidebar.header('This is a sidebar')

st.sidebar.radio('Which one he? ', ('A', 'B', 'C'), 1)

st.sidebar.text_input('Input ur text here')

st.sidebar.selectbox(label='Choose one dumbass :', options=('Aaa', 'Bbb', 'Ccc'))


### DATA VIZ ###
arr = np.random.normal(1, 1, size=100)
fig, ax = plt.subplots()
ax.hist(arr, bins=20)
st.pyplot(fig)