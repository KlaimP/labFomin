python3 /home/postgres/mygit/lab27/convert.py
psql -f /home/postgres/mygit/lab27/lab27_3.sql -d g394-Podyapolskiy
python3 /home/postgres/mygit/lab27/map.py
psql -c "CALL noaa_sample.download_dart_dart()" -d g394-Podyapolskiy
psql -c "CALL noaa_sample.update_station_data()" -d g394-Podyapolskiy
