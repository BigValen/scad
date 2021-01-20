/*************************************************************************************
 *
 * Parametric coaster.
 *
 *************************************************************************************
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR OR COPYRIGHT
 * HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * IT IS NOT PERMITTED TO MODIFY THIS COMMENT BLOCK.
 *
 * (c)2019, Claude "Tryphon" Theroux, Montreal, Quebec, Canada
 * http://www.ctheroux.com/
 *
 ************************************************************************************/

// All sizes are in millimeters.  
outerDiameter = 65;
bottomThickness = 3;
flangeHeight = 0.5;
flangeThickness = 1.2;
logo_height=0.2;

//============================================================
//
// No user modifiable parameters below this line
//

$fn=200;


module logo() {
    translate([-46,-98,flangeHeight+flangeThickness+1.2])
    linear_extrude(height = 0.2+0.2) {
        scale(0.15)
        import("LOTR9.svg");
    }
}

module fillet() {
    rotate_extrude(convexity = 10, $fn = 180)
    translate([outerDiameter / 2 - flangeThickness / 2, 0, 0])
    circle(r = flangeThickness / 2, $fn = 100);
}

difference(){
union() {
    difference() {
        color("red", 0.2) cylinder(r = outerDiameter / 2, h = bottomThickness + flangeHeight);
        translate([0, 0, bottomThickness+0.01])
            color("cyan",0.2)
            cylinder(r = outerDiameter / 2 - flangeThickness, flangeHeight);
    }
    translate([0, 0, flangeHeight + bottomThickness]) fillet();
}
logo();
}
