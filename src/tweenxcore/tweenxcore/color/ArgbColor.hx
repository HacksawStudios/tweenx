package tweenxcore.color;
using tweenxcore.Tools;

class ArgbColor extends RgbColor
{
    public var a:Float;

    public function new(alpha:Float, red:Float, green:Float, blue:Float) {
        this.a = alpha;
        super(red, green, blue);
    }

    public static inline function argbToInt(a:Float, r:Float, g:Float, b:Float):Int {
        return (Std.int(a.clamp() * 0xFF) << 24) | RgbColor.rgbToInt(r, g, b);
    }

    public static inline function of(color:Int) {
        return new ArgbColor(
            ((color >>> 24) & 0xFF) / 0xFF,
            ((color >> 16) & 0xFF) / 0xFF,
            ((color >> 8) & 0xFF) / 0xFF,
            (color & 0xFF) / 0xFF
        );
    }

    public inline function toArgbInt():Int {
        return argbToInt(a, r, g, b);
    }
    
    public inline function toArgbHexString():String {
        return StringTools.hex(toArgbInt(), 8);
    }
    
    public inline function toRgbaCssString():String {
        return "rgba(" + Std.int(r * 0xFF) + "," + Std.int(g * 0xFF) + "," + Std.int(b * 0xFF) + "," + a + ")";
    }
    
    public static inline function fromAhsv(a:Float, h:Float, s:Float, v:Float, hueIndex:Int = 0) {
        return RgbColor.fromHsv(h, s, v).toArgb(a);
    }

    public inline function toAhsv():AhsvColor {
        return AhsvColor.fromArgb(a, r, g, b);
    }
}
