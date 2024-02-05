import 'package:amazonmusiclone/modules/songs/presentation/pages/song_page.dart';
import 'package:flutter/material.dart';

class TopSong extends StatefulWidget {
  const TopSong({super.key});

  @override
  State<TopSong> createState() => _TopSongState();
}

class _TopSongState extends State<TopSong> {
  GestureDetector _showSong(String url, String singerName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => Songs(singerName: singerName)));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Text(
            singerName,
            style: const TextStyle(fontSize: 0),
          ),
          Container(
            margin: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.70,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        padding: const EdgeInsets.all(5),
        children: [
          _showSong('https://i.ytimg.com/vi/ejYe2GwBEJ0/maxresdefault.jpg',
              'Kinni kinni'),
          _showSong(
            'https://m.media-amazon.com/images/M/MV5BNGZlNTFlOWMtMzUwNC00ZDdhLTk0MWUtOGZjYzFlOTBmNDdhXkEyXkFqcGdeQXVyMTUyNjIwMDEw._V1_.jpg',
            'Pushpa',
          ),
          _showSong(
              'https://jobrasta.com/wp-content/uploads/2023/03/0111-1024x576.jpg',
              ''
                  'Bholaa'),
          _showSong(
              'https://filmfare.wwmindia.com/content/2022/jun/jawaan41654408101.jpg',
              'Jawan'),
          _showSong(
              'https://lehren.com/wp-content/uploads/2021/12/check-out-the-new-impressive-poster-of-rrr.jpg',
              'RRR'),
          _showSong(
              'https://mir-s3-cdn-cf.behance.net/project_modules/1400/51054826796257.5635a9602a829.jpg',
              'Bahubali'),
          _showSong(
              'https://m.media-amazon.com/images/M/MV5BMjFhNDQ5NjEtNDE1ZS00YjYwLTgzMjItN2Y2M2RlMjNhZGI4XkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_.jpg',
              'Gabbar'),
          _showSong(
              'https://i.pinimg.com/564x/e1/6d/f6/e16df60fcc3eab0e291c54bfaece748c.jpg',
              'Vikram')
        ],
      ),
    );
  }
}
