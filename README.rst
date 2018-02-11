==================
 Morning Playlist
==================

Description
===========

Play VLC playlist with time announcement every 10 minutes.

You can modify playlist (playlist.m3u) as you like.
(The playlist has one entry "Shonan Beach FM 78.9MHz" <https://www.beachfm.co.jp> by default)

Requirements
============

- OS X El Capitan 10.11 or later
  (Tested on 10.11)
- VLC https://www.videolan.org


Usage
=====

Usage::

  $ morning.sh [time]


Options::

  time - The time format must be 00:00 or 0:00
         If no option or with the wrong format, it will be stop after 1 hour.
