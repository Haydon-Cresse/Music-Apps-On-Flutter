import 'package:flutter/material.dart';
import 'package:musicappflutter/components/neu_box.dart';
import 'package:musicappflutter/model/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        final playlist = value.playlists;
        final currentSong = playlist[value.currentSongIndex];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // custom appbar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back),
                        ),
                        Text("P L A Y L I S T"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.menu),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // album image
                    NeuBox(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double size =
                                    (MediaQuery.of(context).size.width * 0.8).clamp(0, 265);
                                return SizedBox(
                                  width: size,
                                  height: size,
                                  child: Image.asset(
                                    currentSong.albumImagepath,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentSong.songName,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(currentSong.artistName),
                                  ],
                                ),
                                // heart button
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    // song duration progress bar
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // start time
                              Text("0:00"),
                              // middle buttons
                              Icon(Icons.shuffle),
                              SizedBox(width: 10),
                              Icon(Icons.repeat),
                              SizedBox(width: 10),
                              // end time
                              Text("3:30"),
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: 50,
                            activeColor: Colors.blue,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // playback controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: NeuBox(
                              child: Icon(Icons.skip_previous),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {},
                            child: NeuBox(
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: NeuBox(
                              child: Icon(Icons.skip_next),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}