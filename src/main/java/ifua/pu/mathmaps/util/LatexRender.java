package ifua.pu.mathmaps.util;

/**
 * Created by Maxwellt on 12.04.2015.
 */
import java.awt.*;
import java.awt.image.BufferedImage;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;

public class LatexRender {

    public BufferedImage render(String latex) {
        try {
            // create a formula
            TeXFormula formula = new TeXFormula(latex);

            // render the formla to an icon of the same size as the formula.
            TeXIcon icon = formula
                    .createTeXIcon(TeXConstants.STYLE_DISPLAY, 20);

            // insert a border
            icon.setInsets(new Insets(5, 5, 5, 5));

            // now create an actual image of the rendered equation
            BufferedImage image = new BufferedImage(icon.getIconWidth(),
                    icon.getIconHeight(), BufferedImage.TYPE_INT_ARGB);
            Graphics2D g2 = image.createGraphics();
            AlphaComposite composite = AlphaComposite.getInstance(AlphaComposite.CLEAR, 0.0f);
            g2.setComposite(composite);
            g2.setColor(new Color(0, 0, 0, 0));
//            g2.setColor();
            g2.fillRect(0, 0, icon.getIconWidth(), icon.getIconHeight());
            JLabel jl = new JLabel();
            jl.setForeground(new Color(0, 0, 0));
            icon.paintIcon(jl, g2, 0, 0);
            return image;
        } catch (Exception ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error",
                    JOptionPane.INFORMATION_MESSAGE);
            return new BufferedImage(1,1,BufferedImage.TYPE_INT_ARGB);
        }

    }
}
