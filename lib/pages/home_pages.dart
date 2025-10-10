import 'package:flutter/material.dart';
import 'package:musicappflutter/components/my_drawer.dart';
import 'package:musicappflutter/model/song.dart';
import 'package:musicappflutter/model/playlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:musicappflutter/pages/song_page.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // go to song page
  void goToSong(int songIndex) {
    Provider.of<PlaylistProvider>(context, listen: false)
        .setCurrentSongIndex(songIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("P L A Y L I S T")),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Song> playlist = value.playlists;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final song = playlist[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumImagepath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}