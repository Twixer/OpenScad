/*
File: cachePosteRadio.scad

Description:
Cache pour poste auto-radio.

Auteur : Twixer

Licence : CC-By-SA
*/

$fn = 50;
epaisseur_cache = 10;

difference()
{
    color("grey")
        cube([210, 150, epaisseur_cache], center);
    translate([10, 42, -epaisseur_cache])
        cube([182, 52, 2 * epaisseur_cache], center);
}