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
outerDiameter = 75;
bottomThickness = 2;
flangeHeight = 0.5;
flangeThickness = 1.2;
logo_height=0.2;

//============================================================
//
// No user modifiable parameters below this line
//

$fn=150;

module logo() {
    translate([-80,-168.5,2.0])
    linear_extrude(height = 2.5) {
        scale(0.26)
        import("LOTR9-tree.svg");
    }
}

module top_ridge() {
    rotate_extrude(convexity = 10, $fn = 180)
        translate([(outerDiameter / 2 - flangeThickness / 2) - 1.5, 1.7, 0])
        color("black") square(1.3);
}
module bottom_ridge () {
    rotate_extrude(convexity = 10, $fn = 180)
        translate([(outerDiameter / 2 - flangeThickness / 2) - 1.4, -1.0, 0])
        color("black") square(1.1);
}


difference() {
    difference() {
        union() {
            difference() {
                color("red", 0.1) cylinder(r = outerDiameter / 2, h = bottomThickness + flangeHeight);
            }
        }
        logo();
    }
    top_ridge();
}

bottom_ridge();

