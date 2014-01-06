{lint=[]; var c = arguments[2];}
graph = ("strict"? _+)? ("graph" / "digraph" / u_keyword) (_+ ID)? _* '{' stmt_list? _* '}' _* {return lint}
stmt_list = (_* stmt ';'?)+
stmt = subgraph 
	/ ID _* '=' _* (ID / QS)
	/ edge_stmt
	/ attr_stmt
	/ node_stmt
attr_stmt = ("graph" / "node" / "edge") _+ attr_list
u_keyword = e:[^ ]+ {lint.push({pos: pos, text:"Unknown keyword '"+e.join('')+"'"})}
attr_list = '[' _* a_list? _* ']' attr_list?
a_list    = a_name _* '=' _* ID (_* ',' _* a_list)* / e:ID _* '=' _* ID (_* ',' _* a_list)* {lint.push({pos: pos, text: "Unknown attribute '"+e.join('')+"'"})}
edge_stmt = (node_id / subgraph) edgeRHS _* attr_list?
edgeRHS   = _* edgeop _* (node_id / subgraph) edgeRHS?
node_stmt = node_id _* attr_list?
node_id   = ID _* port?
port 	  = ':' _* ID ( ':' _* compass_pt)?
	/ 	':' _* compass_pt
subgraph  = ("subgraph" _+ ID?)? _* '{' stmt_list _* '}'
compass_pt = "n" / "ne" / "e" / "se" / "s" / "sw" / "w" / "nw" / "c"
edgeop = "--" / "->"
comment "comment" = lcomment / bcomment / pcomment
lcomment = "//" [^\n]*
pcomment = CR "#" [^\n]*
bcomment = "/*" [^*]* "*"+ ([^/*] [^*]* "*"+)* "/"

a_name =
    "damping"
	/ "k"
	/ "url"
	/ "area"
	/ "arrowhead"
	/ "arrowsize"
	/ "arrowtail"
	/ "aspect"
	/ "bb"
	/ "bgcolor"
	/ "center"
	/ "charset"
	/ "clusterrank"
	/ "color"
	/ "colorscheme"
	/ "comment"
	/ "compound"
	/ "concentrate"
	/ "constraint"
	/ "decorate"
	/ "defaultdist"
	/ "dim"
	/ "dimen"
	/ "dir"
	/ "diredgeconstraints"
	/ "distortion"
	/ "dpi"
	/ "edgeurl"
	/ "edgehref"
	/ "edgetarget"
	/ "edgetooltip"
	/ "epsilon"
	/ "esep"
	/ "fillcolor"
	/ "fixedsize"
	/ "fontcolor"
	/ "fontname"
	/ "fontnames"
	/ "fontpath"
	/ "fontsize"
	/ "forcelabels"
	/ "gradientangle"
	/ "group"
	/ "headurl"
	/ "head_lp"
	/ "headclip"
	/ "headhref"
	/ "headlabel"
	/ "headport"
	/ "headtarget"
	/ "headtooltip"
	/ "height"
	/ "href"
	/ "id"
	/ "image"
	/ "imagepath"
	/ "imagescale"
	/ "label"
	/ "labelurl"
	/ "label_scheme"
	/ "labelangle"
	/ "labeldistance"
	/ "labelfloat"
	/ "labelfontcolor"
	/ "labelfontname"
	/ "labelfontsize"
	/ "labelhref"
	/ "labeljust"
	/ "labelloc"
	/ "labeltarget"
	/ "labeltooltip"
	/ "landscape"
	/ "layer"
	/ "layerlistsep"
	/ "layers"
	/ "layerselect"
	/ "layersep"
	/ "layout"
	/ "len"
	/ "levels"
	/ "levelsgap"
	/ "lhead"
	/ "lheight"
	/ "lp"
	/ "ltail"
	/ "lwidth"
	/ "margin"
	/ "maxiter"
	/ "mclimit"
	/ "mindist"
	/ "minlen"
	/ "mode"
	/ "model"
	/ "mosek"
	/ "nodesep"
	/ "nojustify"
	/ "normalize"
	/ "nslimit"
	/ "nslimit1"
	/ "ordering"
	/ "orientation"
	/ "outputorder"
	/ "overlap"
	/ "overlap_scaling"
	/ "pack"
	/ "packmode"
	/ "pad"
	/ "page"
	/ "pagedir"
	/ "pencolor"
	/ "penwidth"
	/ "peripheries"
	/ "pin"
	/ "pos"
	/ "quadtree"
	/ "quantum"
	/ "rank"
	/ "rankdir"
	/ "ranksep"
	/ "ratio"
	/ "rects"
	/ "regular"
	/ "remincross"
	/ "repulsiveforce"
	/ "resolution"
	/ "root"
	/ "rotate"
	/ "rotation"
	/ "samehead"
	/ "sametail"
	/ "samplepoints"
	/ "scale"
	/ "searchsize"
	/ "sep"
	/ "shape"
	/ "shapefile"
	/ "showboxes"
	/ "sides"
	/ "size"
	/ "skew"
	/ "smoothing"
	/ "sortv"
	/ "splines"
	/ "start"
	/ "style"
	/ "stylesheet"
	/ "tailurl"
	/ "tail_lp"
	/ "tailclip"
	/ "tailhref"
	/ "taillabel"
	/ "tailport"
	/ "tailtarget"
	/ "tailtooltip"
	/ "target"
	/ "tooltip"
	/ "truecolor"
	/ "vertices"
	/ "viewport"
	/ "voro_margin"
	/ "weight"
	/ "width"
	/ "xlabel"
	/ "xlp"
	/ "z"

ID = [a-zA-Z0-9_]+
QS = '"' [^"]* '"'

CR = [\n]
_ "whitespace" = comment* [\n\t ]