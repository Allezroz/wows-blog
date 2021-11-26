Ship Selections by High Level Clans
================
26/11/2021

I’ve already visualised/made available the team makeup and ship
selections we play against, as well as respective winrates. However, I
think it would be useful to see a breakdown of the ‘good’ teams we play
against, and see if there are any things that they do that we struggle
with, ships they select when the general population doesn’t, and so on.

Fundamentally, I should turn this into a dashboard element, since it
will be interesting to see as things evolve. For the moment, I’m going
to do this instead, because adding more blended data sources to google
sheets feels like I’m just tacking things on, since they get less and
less integrated. I’ll get there.

It is worth noting that I think when I wrote my script that grabs enemy
ratings, I lazily hardcoded season 14, so ratings will be based off a
previous season. However, for purposes, I think this is fine - it gives
us the historical ty/hurricane/etc clans, and they will in theory
perform at the same or a higher level now.

As a starting point, what ships do ‘good’ players run in CBs, and how
does that compare to the general population?

``` r
goodPlayers %>% 
  ggplot(aes(x=Ship,fill=LeagueText,y = (..count..)/sum(..count..)))+
  scale_fill_manual(values=LeagueColours)+
  geom_bar()+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),legend.position = "none")+
  facet_wrap(~Class,scales="free_x")+
  scale_y_continuous(labels=scales::percent)+
  ylab("Relative Frequency")
```

![Relative Frequency of Ship Picks](/wows-blog/assets/2021-11-26-good-clan-comps_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

Unsurprisingly, most ships that are popular are approximately uniformly
popular between the ‘good’ leagues. Ragnars are more popular in
Hurricane, but this could be an availability bias - the better and/or
more dedicated the cohort, the more likely they are to have more
resources and spend them more aggressively on the better ships. I would
expect this to carry over into Smaland, which had limited availability,
as well as Ohio, but Ohio has existed for so long that there is unlikely
to be a substantial gap - ditto Marceau and Stalingrad.

In S15, the highest rate at which a ship can be seen is about 14.3%. In
the ‘good player’ cohort, Petro hits 13.1% of ships selected - 1 of
every 7.6 ships seen on a team is a Petro. The next three are a margin
less popular - Ohio at 9.2%, Smaland at 9%, and Kremlin at 7.1% - with
everything else falling away quite rapidly.

The obvious questions follow: how much of a difference is there in ship
picks between cohorts?

``` r
ggplot(data=tyShips %>% filter(Class=="BB"),aes(x=Ship,y = prop))+
  geom_point(colour="#BEE8D0")+
  geom_point(data=hurShips %>% filter(Class=="BB"), colour="#BD53CC")+
  geom_point(data=allShips %>% filter(Class=="BB"),colour="bisque3")+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),legend.position = "none")+
  ylab("Relative Frequency")+
  ggtitle("Relative Frequency of BB Picks by League")
```

![BB picks](/wows-blog/assets/2021-11-26-good-clan-comps_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
ggplot(data=tyShips %>% filter(Class=="CA"),aes(x=Ship,y = prop))+
  geom_point(colour="#BEE8D0")+
  geom_point(data=hurShips %>% filter(Class=="CA"), colour="#BD53CC")+
  geom_point(data=allShips %>% filter(Class=="CA"),colour="bisque3")+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),legend.position = "none")+
  ylab("Relative Frequency")+
  ggtitle("Relative Frequency of CA Picks by League")
```

![CA picks](/wows-blog/assets/2021-11-26-good-clan-comps_files/figure-gfm/unnamed-chunk-3-2.png)<!-- -->

``` r
ggplot(data=tyShips %>% filter(Class=="DD"),aes(x=Ship,y = prop))+
  geom_point(colour="#BEE8D0")+
  geom_point(data=hurShips %>% filter(Class=="DD"), colour="#BD53CC")+
  geom_point(data=allShips %>% filter(Class=="DD"),colour="bisque3")+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),legend.position = "none")+
  ylab("Relative Frequency")+
  ggtitle("Relative Frequency of DD Picks by League")
```

![DD picks](/wows-blog/assets/2021-11-26-good-clan-comps_files/figure-gfm/unnamed-chunk-3-3.png)<!-- -->

A bit cluttered, since it includes all the low-frequency picks. Most
interesting takeaways: 
- The french BBs are not especially popular
anywhere, presumably you have to build around them to make them ‘work’ 
- Yamatos are surprisingly common among ‘good’ teams 
- approximately twice as likely to be picked in ty/hur than among the general population 
- Ohios are picked slightly less often among ‘good’ teams. There is a dip
in Kremlins in Ty, but not Hur. I would expect this to be a reaction to
the Yamato pickrate: it overmatches Ohio pretty much everywhere, while
Kremlin remains sturdy. This probably also explains the Conq spike in Ty
not being reflected in Hurricane. 
- Petros are in almost every game at
almost every level. If WG is going to ban a ship this season, Petro is
my first bet. 
- Kiting ships are pretty scattered at every level. Nevsky
takes top spot, with Napoli at about the same level among the highest
level players. Venezia is slightly behind the two. 
- Salem and DM appear relatively frequently among all levels - Salem more in Hur, DM more in
Ty. If we amalgamated them, DM-alike would be the second most popular
ship overall. They appear together twice out of the 104 games we’ve
played this season. 
- Russian cruisers are a bit popular. 
- Smaland is the top pick DD by a long way, especially among better players. Ragnar
is second among hurricane teams. They are picked together in more than
10% of games (14/104, 11/14 with Ty or Hurricane clans) 
- Spotting DDs are relatively uncommon, with Somers topping the list below 5% in all
leagues.

There might be a few ship selection takeaways for us if we want to
emulate the big boys we’ve played against, or potential pitfalls to
avoid: lighter BBs seem out of favour, and revisiting DM/Salem may be in
order. Napoli might be worth another look as a kiting ship if we want to
run two of them. We should probably rethink our reliance on shima/somers
and maybe even daring if we have Ragnar/Smalands available.
