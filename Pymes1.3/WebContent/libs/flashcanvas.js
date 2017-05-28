/*
 FlashCanvas, 2012-11-01T22:38 commit ID 34a50cbe6aeb11e050c7d41e8e2cf266a345aeed
 Copyright 2012 Willow Systems Corp
 Copyright (c) 2009      Tim Cameron Ryan
 Copyright (c) 2009-2011 FlashCanvas Project
 Released under the MIT/X License
*/
window.ActiveXObject && !window.CanvasRenderingContext2D && function() {
    function D(a) {
        return ((a[C + "Options"] || {}).swfPath || K) + "flashcanvas.swf"
    }

    function s(a) {
        return ("" + a).replace(/&/g, "&amp;").replace(/</g, "&lt;")
    }

    function i(a) {
        throw new E(a);
    }

    function F(a) {
        var b = parseInt(a.width, 10),
            c = parseInt(a.height, 10);
        if (isNaN(b) || 0 > b) b = 300;
        if (isNaN(c) || 0 > c) c = 150;
        a.width = b;
        a.height = c
    }
    var G = this.document,
        t = "canvas",
        C = "FlashCanvas",
        H = "onreadystatechange",
        n;
    a: {
        n = this.document.getElementsByTagName("script");
        var I = "",
            u = n.length;
        if (u)
            for (I = n[u - 1].src || ""; u;) {
                script = n[u - 1];
                if (script.src && script.src.match("flashcanvas")) {
                    n = 8 <= G.documentMode ? script.src : script.getAttribute("src", 4);
                    break a
                }
                u--
            }
        n = I
    }
    var K = n.replace(/[^\/]+$/, ""),
        e = new function(a) {
            for (var b = 0, c = a.length; b < c; b++) this[a[b]] = b
        }("toDataURL save restore scale rotate translate transform setTransform globalAlpha globalCompositeOperation strokeStyle fillStyle createLinearGradient createRadialGradient createPattern lineWidth lineCap lineJoin miterLimit shadowOffsetX shadowOffsetY shadowBlur shadowColor clearRect fillRect strokeRect beginPath closePath moveTo lineTo quadraticCurveTo bezierCurveTo arcTo rect arc fill stroke clip isPointInPath font textAlign textBaseline fillText strokeText measureText drawImage createImageData getImageData putImageData addColorStop direction resize".split(" ")),
        v = {},
        p = {},
        q = {},
        x = {},
        y = {},
        w = function(a, b) {
            this.canvas = a;
            this._swf = b;
            this._canvasId = b.id.slice(8);
            this._initialize();
            this._gradientPatternId = 0;
            this._font = this._direction = "";
            var c = this;
            this._executeCommandIntervalID = setInterval(function() {
                for (var a = c.canvas, b = !1, a = a.parentNode; a && !b;) b = a.body, a = a.parentNode;
                b ? 0 === q[c._canvasId] && c._executeCommand() : clearInterval(c._executeCommandIntervalID)
            }, 30)
        };
    w.prototype = {
        save: function() {
            this._setCompositing();
            this._setShadows();
            this._setStrokeStyle();
            this._setFillStyle();
            this._setLineStyles();
            this._setFontStyles();
            this._stateStack.push([this._globalAlpha, this._globalCompositeOperation, this._strokeStyle, this._fillStyle, this._lineWidth, this._lineCap, this._lineJoin, this._miterLimit, this._shadowOffsetX, this._shadowOffsetY, this._shadowBlur, this._shadowColor, this._font, this._textAlign, this._textBaseline]);
            this._queue.push(e.save)
        },
        restore: function() {
            var a = this._stateStack;
            a.length && (a = a.pop(), this.globalAlpha = a[0], this.globalCompositeOperation = a[1], this.strokeStyle = a[2],
                this.fillStyle = a[3], this.lineWidth = a[4], this.lineCap = a[5], this.lineJoin = a[6], this.miterLimit = a[7], this.shadowOffsetX = a[8], this.shadowOffsetY = a[9], this.shadowBlur = a[10], this.shadowColor = a[11], this.font = a[12], this.textAlign = a[13], this.textBaseline = a[14]);
            this._queue.push(e.restore)
        },
        scale: function(a, b) {
            this._queue.push(e.scale, a, b)
        },
        rotate: function(a) {
            this._queue.push(e.rotate, a)
        },
        translate: function(a, b) {
            this._queue.push(e.translate, a, b)
        },
        transform: function(a, b, c, d, f, g) {
            this._queue.push(e.transform,
                a, b, c, d, f, g)
        },
        setTransform: function(a, b, c, d, f, g) {
            this._queue.push(e.setTransform, a, b, c, d, f, g)
        },
        _setCompositing: function() {
            var a = this._queue;
            this._globalAlpha !== this.globalAlpha && (this._globalAlpha = this.globalAlpha, a.push(e.globalAlpha, this._globalAlpha));
            this._globalCompositeOperation !== this.globalCompositeOperation && (this._globalCompositeOperation = this.globalCompositeOperation, a.push(e.globalCompositeOperation, this._globalCompositeOperation))
        },
        _setStrokeStyle: function() {
            if (this._strokeStyle !== this.strokeStyle) {
                var a =
                    this._strokeStyle = this.strokeStyle;
                if ("string" !== typeof a)
                    if (a instanceof r || a instanceof z) a = a.id;
                    else return;
                this._queue.push(e.strokeStyle, a)
            }
        },
        _setFillStyle: function() {
            if (this._fillStyle !== this.fillStyle) {
                var a = this._fillStyle = this.fillStyle;
                if ("string" !== typeof a)
                    if (a instanceof r || a instanceof z) a = a.id;
                    else return;
                this._queue.push(e.fillStyle, a)
            }
        },
        createLinearGradient: function(a, b, c, d) {
            (!isFinite(a) || !isFinite(b) || !isFinite(c) || !isFinite(d)) && i(9);
            this._queue.push(e.createLinearGradient, a, b,
                c, d);
            return new r(this)
        },
        createRadialGradient: function(a, b, c, d, f, g) {
            (!isFinite(a) || !isFinite(b) || !isFinite(c) || !isFinite(d) || !isFinite(f) || !isFinite(g)) && i(9);
            (0 > c || 0 > g) && i(1);
            this._queue.push(e.createRadialGradient, a, b, c, d, f, g);
            return new r(this)
        },
        createPattern: function(a, b) {
            a || i(17);
            var c = a.tagName,
                d, f = this._canvasId;
            if (c)
                if (c = c.toLowerCase(), "img" === c) d = a.getAttribute("src", 2);
                else {
                    if (c === t || "video" === c) return;
                    i(17)
                }
            else a.src ? d = a.src : i(17);
            "repeat" === b || ("no-repeat" === b || "repeat-x" === b || "repeat-y" ===
                b || "" === b || null === b) || i(12);
            this._queue.push(e.createPattern, s(d), b);
            !p[f][d] && v[f] && (this._executeCommand(), ++q[f], p[f][d] = !0);
            return new z(this)
        },
        _setLineStyles: function() {
            var a = this._queue;
            this._lineWidth !== this.lineWidth && (this._lineWidth = this.lineWidth, a.push(e.lineWidth, this._lineWidth));
            this._lineCap !== this.lineCap && (this._lineCap = this.lineCap, a.push(e.lineCap, this._lineCap));
            this._lineJoin !== this.lineJoin && (this._lineJoin = this.lineJoin, a.push(e.lineJoin, this._lineJoin));
            this._miterLimit !==
                this.miterLimit && (this._miterLimit = this.miterLimit, a.push(e.miterLimit, this._miterLimit))
        },
        _setShadows: function() {
            var a = this._queue;
            this._shadowOffsetX !== this.shadowOffsetX && (this._shadowOffsetX = this.shadowOffsetX, a.push(e.shadowOffsetX, this._shadowOffsetX));
            this._shadowOffsetY !== this.shadowOffsetY && (this._shadowOffsetY = this.shadowOffsetY, a.push(e.shadowOffsetY, this._shadowOffsetY));
            this._shadowBlur !== this.shadowBlur && (this._shadowBlur = this.shadowBlur, a.push(e.shadowBlur, this._shadowBlur));
            this._shadowColor !==
                this.shadowColor && (this._shadowColor = this.shadowColor, a.push(e.shadowColor, this._shadowColor))
        },
        clearRect: function(a, b, c, d) {
            this._queue.push(e.clearRect, a, b, c, d)
        },
        fillRect: function(a, b, c, d) {
            this._setCompositing();
            this._setShadows();
            this._setFillStyle();
            this._queue.push(e.fillRect, a, b, c, d)
        },
        strokeRect: function(a, b, c, d) {
            this._setCompositing();
            this._setShadows();
            this._setStrokeStyle();
            this._setLineStyles();
            this._queue.push(e.strokeRect, a, b, c, d)
        },
        beginPath: function() {
            this._queue.push(e.beginPath)
        },
        closePath: function() {
            this._queue.push(e.closePath)
        },
        moveTo: function(a, b) {
            this._queue.push(e.moveTo, a, b)
        },
        lineTo: function(a, b) {
            this._queue.push(e.lineTo, a, b)
        },
        quadraticCurveTo: function(a, b, c, d) {
            this._queue.push(e.quadraticCurveTo, a, b, c, d)
        },
        bezierCurveTo: function(a, b, c, d, f, g) {
            this._queue.push(e.bezierCurveTo, a, b, c, d, f, g)
        },
        arcTo: function(a, b, c, d, f) {
            0 > f && isFinite(f) && i(1);
            this._queue.push(e.arcTo, a, b, c, d, f)
        },
        rect: function(a, b, c, d) {
            this._queue.push(e.rect, a, b, c, d)
        },
        arc: function(a, b, c, d, f, g) {
            0 > c && isFinite(c) && i(1);
            this._queue.push(e.arc, a, b, c, d, f, g ? 1 : 0)
        },
        fill: function() {
            this._setCompositing();
            this._setShadows();
            this._setFillStyle();
            this._queue.push(e.fill)
        },
        stroke: function() {
            this._setCompositing();
            this._setShadows();
            this._setStrokeStyle();
            this._setLineStyles();
            this._queue.push(e.stroke)
        },
        clip: function() {
            this._queue.push(e.clip)
        },
        isPointInPath: function() {},
        _setFontStyles: function() {
            var a = this._queue;
            if (this._font !== this.font) try {
                var b = y[this._canvasId];
                b.style.font = this._font = this.font;
                var c = b.currentStyle,
                    d = [c.fontStyle, c.fontWeight, b.offsetHeight,
                        c.fontFamily
                    ].join(" ");
                a.push(e.font, d)
            } catch (f) {}
            this._textAlign !== this.textAlign && (this._textAlign = this.textAlign, a.push(e.textAlign, this._textAlign));
            this._textBaseline !== this.textBaseline && (this._textBaseline = this.textBaseline, a.push(e.textBaseline, this._textBaseline));
            this._direction !== this.canvas.currentStyle.direction && (this._direction = this.canvas.currentStyle.direction, a.push(e.direction, this._direction))
        },
        fillText: function(a, b, c, d) {
            this._setCompositing();
            this._setFillStyle();
            this._setShadows();
            this._setFontStyles();
            this._queue.push(e.fillText, s(a), b, c, void 0 === d ? Infinity : d)
        },
        strokeText: function(a, b, c, d) {
            this._setCompositing();
            this._setStrokeStyle();
            this._setShadows();
            this._setFontStyles();
            this._queue.push(e.strokeText, s(a), b, c, void 0 === d ? Infinity : d)
        },
        measureText: function(a) {
            var b = y[this._canvasId];
            try {
                b.style.font = this.font
            } catch (c) {}
            b.innerText = a.replace(/[ \n\f\r]/g, "\t");
            return new L(b.offsetWidth)
        },
        drawImage: function(a, b, c, d, f, g, j, M, N) {
            a || i(17);
            var h = a.tagName,
                k, l = arguments.length,
                A = this._canvasId;
            if (h)
                if (h = h.toLowerCase(), "img" === h) k = a.getAttribute("src", 2);
                else {
                    if (h === t || "video" === h) return;
                    i(17)
                }
            else a.src ? k = a.src : i(17);
            this._setCompositing();
            this._setShadows();
            k = s(k);
            if (3 === l) this._queue.push(e.drawImage, l, k, b, c);
            else if (5 === l) this._queue.push(e.drawImage, l, k, b, c, d, f);
            else if (9 === l)(0 === d || 0 === f) && i(1), this._queue.push(e.drawImage, l, k, b, c, d, f, g, j, M, N);
            else return;
            !p[A][k] && v[A] && (this._executeCommand(), ++q[A], p[A][k] = !0)
        },
        createImageData: function() {},
        getImageData: function() {},
        putImageData: function() {},
        loadImage: function(a, b, c) {
            var d = a.tagName,
                f, g = this._canvasId;
            d ? "img" === d.toLowerCase() && (f = a.getAttribute("src", 2)) : a.src && (f = a.src);
            if (f && !p[g][f]) {
                if (b || c) x[g][f] = [a, b, c];
                this._queue.push(e.drawImage, 1, s(f));
                v[g] && (this._executeCommand(), ++q[g], p[g][f] = !0)
            }
        },
        _initialize: function() {
            this.globalAlpha = this._globalAlpha = 1;
            this.globalCompositeOperation = this._globalCompositeOperation = "source-over";
            this.fillStyle = this._fillStyle = this.strokeStyle = this._strokeStyle = "#000000";
            this.lineWidth =
                this._lineWidth = 1;
            this.lineCap = this._lineCap = "butt";
            this.lineJoin = this._lineJoin = "miter";
            this.miterLimit = this._miterLimit = 10;
            this.shadowBlur = this._shadowBlur = this.shadowOffsetY = this._shadowOffsetY = this.shadowOffsetX = this._shadowOffsetX = 0;
            this.shadowColor = this._shadowColor = "rgba(0, 0, 0, 0.0)";
            this.font = this._font = "10px sans-serif";
            this.textAlign = this._textAlign = "start";
            this.textBaseline = this._textBaseline = "alphabetic";
            this._queue = [];
            this._stateStack = []
        },
        _flush: function() {
            var a = this._queue;
            this._queue = [];
            return a
        },
        _executeCommand: function() {
            var a = this._flush();
            if (0 < a.length) try {
                return eval(this._swf.CallFunction('<invoke name="executeCommand" returntype="javascript"><arguments><string>' + a.join("&#0;") + "</string></arguments></invoke>"))
            } catch (b) {}
        },
        _resize: function(a, b) {
            this._executeCommand();
            this._initialize();
            0 < a && (this._swf.width = a);
            0 < b && (this._swf.height = b);
            this._queue.push(e.resize, a, b)
        }
    };
    var r = function(a) {
        this._ctx = a;
        this.id = a._gradientPatternId++
    };
    r.prototype = {
        addColorStop: function(a, b) {
            (isNaN(a) ||
                0 > a || 1 < a) && i(1);
            this._ctx._queue.push(e.addColorStop, this.id, a, b)
        }
    };
    var z = function(a) {
            this.id = a._gradientPatternId++
        },
        L = function(a) {
            this.width = a
        },
        E = function(a) {
            this.code = a;
            this.message = {
                1: "INDEX_SIZE_ERR",
                9: "NOT_SUPPORTED_ERR",
                11: "INVALID_STATE_ERR",
                12: "SYNTAX_ERR",
                17: "TYPE_MISMATCH_ERR",
                18: "SECURITY_ERR"
            }[a]
        };
    E.prototype = Error();
    var J = "initElement",
        m = {
            registeredEvents: {},
            canvases: {},
            initWindow: function(a) {
                function b() {
                    if ("complete" === a.document.readyState) {
                        a.document.detachEvent(H, b);
                        for (var c = a.document.getElementsByTagName(t),
                                d = 0, e = c.length; d < e; ++d) m[J](c[d])
                    }
                }
                var c = a.document;
                c.createElement(t);
                c.createStyleSheet().cssText = t + "{display:inline-block;overflow:hidden;width:300px;height:150px}";
                var d = this.canvases,
                    e = this.registeredEvents,
                    g = function() {
                        a.detachEvent("onunload", g);
                        var b, c, h, k, l, j, B;
                        for (B in d)
                            if (b = d[B], c = b.firstChild, k = b.ownerDocument.defaultView ? b.ownerDocument.defaultView : b.ownerDocument.parentWindow, a === k) {
                                for (h in c) "function" === typeof c[h] && (c[h] = null);
                                for (h in b) "function" === typeof b[h] && (b[h] = null);
                                k =
                                    0;
                                for (l = e[B].length; k !== l; k++) j = e[B][k], c.detachEvent(j[0], j[1]), b.detachEvent(j[0], j[1])
                            }
                        a.CanvasRenderingContext2D = null;
                        a.CanvasGradient = null;
                        a.CanvasPattern = null;
                        a[C] = null
                    };
                a.attachEvent("onunload", g);
                a.CanvasRenderingContext2D = w;
                a.CanvasGradient = r;
                a.CanvasPattern = z;
                a[C] = m;
                var j = D(a);
                0 === j.indexOf(a.location.protocol + "//" + a.location.host + "/") && a.setTimeout(function() {
                    var a = new ActiveXObject("Microsoft.XMLHTTP");
                    a.open("GET", j, !1);
                    a.send(null)
                }, 0);
                "complete" === a.document.readyState ? b() : a.document.attachEvent(H,
                    b)
            }
        };
    m[J] = function(a) {
        if (a.getContext) return a;
        var b = a.ownerDocument,
            c = b.defaultView ? b.defaultView : b.parentWindow;
        c.CanvasRenderingContext2D || this.initWindow(c);
        var d = Math.random().toString(36).slice(2) || "0",
            f = "external" + d;
        v[d] = !1;
        p[d] = {};
        q[d] = 1;
        x[d] = {};
        this.registeredEvents[d] = [];
        F(a);
        var g = D(c);
        a.innerHTML = '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="' + ("https:" === c.location.protocol ? "https:" : "http:") + '//fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="100%" height="100%" id="' +
            f + '"><param name="allowScriptAccess" value="always"><param name="flashvars" value="id=' + f + '"><param name="wmode" value="transparent"></object><span style="margin:0;padding:0;border:0;display:inline-block;position:static;height:1em;overflow:visible;white-space:nowrap"></span>';
        this.canvases[d] = a;
        var j = a.firstChild;
        y[d] = a.lastChild;
        var i = b.body.contains;
        if (i(a)) j.movie = g;
        else var m = c.setInterval(function() {
            i(a) && (c.clearInterval(m), j.movie = g)
        }, 2);
        if ("BackCompat" === b.compatMode || !c.XMLHttpRequest) y[d].style.overflow =
            "hidden";
        var h = new w(a, j);
        a.getContext = function(a) {
            return "2d" === a ? h : null
        };
        a.toDataURL = function(a, b) {
            "image/jpeg" === ("" + a).toLowerCase() ? h._queue.push(e.toDataURL, a, "number" === typeof b ? b : "") : h._queue.push(e.toDataURL, a);
            return h._executeCommand()
        };
        b = function(a) {
            var a = a ? a.srcElement : c.event.srcElement,
                b = a.parentNode;
            a.blur();
            b.focus()
        };
        this.registeredEvents[d].push(["onfocus", b]);
        j.attachEvent("onfocus", b);
        return a
    };
    m.saveImage = function(a) {
        a.firstChild.saveImage()
    };
    m.setOptions = function() {};
    m.trigger =
        function(a, b) {
            this.canvases[a].fireEvent("on" + b)
        };
    m.unlock = function(a, b, c) {
        try {
            var d, e, g, j, i, m, h, k, l;
            if (void 0 === b) d = this.canvases[a], e = d.firstChild, k = d.ownerDocument, l = k.defaultView ? k.defaultView : k.parentWindow, F(d), g = d.width, j = d.height, d.style.width = g + "px", d.style.height = j + "px", 0 < g && (e.width = g), 0 < j && (e.height = j), e.resize(g, j), b = function(a) {
                var a = a ? a : l.event,
                    b = a.propertyName;
                if ("width" === b || "height" === b) {
                    var a = a.srcElement,
                        c = a[b],
                        d = parseInt(c, 10);
                    if (isNaN(d) || 0 > d) d = "width" === b ? 300 : 150;
                    c === d ? (a.style[b] =
                        d + "px", a.getContext("2d")._resize(a.width, a.height)) : a[b] = d
                }
            }, this.registeredEvents[a].push(["onpropertychange", b]), d.attachEvent("onpropertychange", b), v[a] = !0, "function" === typeof d.onload && l.setTimeout(function() {
                d.onload()
            }, 0);
            else if (i = x[a][b]) m = i[0], h = i[1 + c], delete x[a][b], "function" === typeof h && h.call(m);
            q[a] && --q[a]
        } catch (n) {
            throw console.log("Call to FlashCanvas.unlock had thrown an error: ", n.message), n;
        }
    };
    m.initWindow(this, G);
    keep = [w.measureText, w.loadImage]
}.call(window);