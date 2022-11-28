# Analyzing Media Sales Data #

This project is designed to demonstrate the fundamental understanding of SQL using SQLite

The original project requirements may be found [here](https://discuss.codecademy.com/t/data-science-independent-project-2-explore-a-sample-database/419945).

The `chinook` database (.db) file needed for this project may be downloaded from this repository as well. Below is a relational database map for the `chinook` database to refer to throughout this project.

![music database](https://www.sqlitetutorial.net/wp-content/uploads/2015/11/sqlite-sample-database-color.jpg "Relational database map for 'chinook' media sales ")

## Objective ##

You are the lead data analyst for a popular music and media store. Help them analyze their sales and service.

## Tasks ##
------------
1. Which tracks appeared in the most playlists? How many playlists did they appear in?

    Code:
    ```
    --Exploring the tracks table to get our bearings.
    --3503 track ids, A few songs, like 2 Seconds to Midnight and 1° De Julho are in the tracks table multiple times with multiple trackid's.

    SELECT name, trackid
    FROM tracks
    ORDER BY name asc;

    --We join the tracks and playlist_track tables on TrackId
    SELECT tracks.name, COUNT(*) AS "Track Count"
    FROM playlist_track
    INNER JOIN tracks 
        ON tracks.TrackId = playlist_track.TrackId
    GROUP BY tracks.name
    ORDER BY COUNT(tracks.name) DESC;
    ```

    <details> <summary> Click here for results</summary> 
    <p>

    ### Strictly speaking about the song itself, 2 Minutes to Midnight is the winner, showing up 13 times in all the playlists. However, this song has 5 separate TrackIDs. This could mean it appears in several albums, such as a remastered album, a greatest hits album, etc, and may have different audio quality among the different TrackIDs, which would be important for a media company. ###

    Name|Track Count
    ---| ---
    2 Minutes To Midnight|	13
    Wrathchild|	12
    The Trooper|	12
    The Number Of The Beast|	12
    Iron Maiden|	12
    Hallowed Be Thy Name|	12
    Fear Of The Dark|	11
    The Evil That Men Do|	10
    Sanctuary|	10
    Running Free|	10
    Wasting Love|	9
    Tailgunner|	9
    Release|	9
    From Here To Eternity|	9
    Be Quick Or Be Dead|	9
    Afraid To Shoot Strangers|	9
    The Clairvoyant|	8
    Midnight|	8
    Intro|	8
    Heaven Can Wait|	8


    </p>
    </details>
