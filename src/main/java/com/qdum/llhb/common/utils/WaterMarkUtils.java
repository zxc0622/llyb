package com.qdum.llhb.common.utils;

import com.jfinal.kit.PathKit;
import org.apache.commons.lang.StringUtils;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

/**
 * 给图片加水印
 * Created by ZhouXiang on 2016/08/12
 */
public class WaterMarkUtils {
    /**
     * 图片添加水印
     *
     * @param srcImgPath       需要添加水印的图片的路径
     * @param outImgPath       添加水印后图片输出路径
     * @param markContentColor 水印文字的颜色
     * @param waterMarkContent 水印的文字
     * @param imgaeFormat      图片格式
     */
    public void mark(String srcImgPath, String outImgPath, Color markContentColor, String waterMarkContent, String imgaeFormat) {
        try {
            // 读取原图片信息
            File srcImgFile = new File(srcImgPath);
            Image srcImg = ImageIO.read(srcImgFile);
            int srcImgWidth = srcImg.getWidth(null);
            int srcImgHeight = srcImg.getHeight(null);
            // 加水印
            BufferedImage bufImg = new BufferedImage(srcImgWidth, srcImgHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufImg.createGraphics();
            g.drawImage(srcImg, 0, 0, srcImgWidth, srcImgHeight, null);
            //Font font = new Font("Courier New", Font.PLAIN, 12);
            Font font = new Font("宋体", Font.PLAIN, 30);
            g.setColor(markContentColor); //根据图片的背景设置水印颜色

            g.setFont(font);
            //int x = srcImgWidth - getWatermarkLength(waterMarkContent, g) - 3;
            //int y = srcImgHeight - 3;
            int x = (srcImgWidth - getWatermarkLength(waterMarkContent, g)) / 2;
            int y = srcImgHeight / 2 - 3;
            g.drawString(waterMarkContent, x, y);
            g.dispose();
            // 输出图片
            FileOutputStream outImgStream = new FileOutputStream(outImgPath);
            ImageIO.write(bufImg, imgaeFormat, outImgStream);
            outImgStream.flush();
            outImgStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取水印文字总长度
     *
     * @param waterMarkContent 水印的文字
     * @param g
     * @return 水印文字总长度
     */
    public  int getWatermarkLength(String waterMarkContent, Graphics2D g) {
        return g.getFontMetrics(g.getFont()).charsWidth(waterMarkContent.toCharArray(), 0, waterMarkContent.length());
    }

 /*   public static void main(String[] args) {
        //1,给图片添加文字, 原图位置, 输出图片位置, 水印文字颜色, 水印文字
        //new WaterMarkUtils().mark("d:/qwe.jpeg", "d:/qwe2.jpeg", Color.red, "优蚁环保网专用","jpeg");
        File waterMarkImageFile = new File(PathKit.getWebRootPath(),"/static/img/water_mark.png");
        System.out.println(waterMarkImageFile.toString());
        //2,给图片添加水印图片
        String srcImgPath = "d:/hy.jpg"; //原图
        String iconPath = "d:/youyi.png";//水印
        String targerPath = "d:/hy2.jpg";//输出路径
        String targerPath2 = "d:/hy3.jpg";//输出路径
        // 给图片添加水印
        WaterMarkUtils.markImageByIcon(iconPath, srcImgPath, targerPath);
        // 给图片添加水印,水印旋转-45
        WaterMarkUtils.markImageByIcon(iconPath, srcImgPath, targerPath2, -45);

    }*/

    /**
     * 给图片添加水印
     *
     * @param iconPath   水印图片路径
     * @param srcImgPath 源图片路径
     * @param targerPath 目标图片路径
     */
    public static void markImageByIcon(String iconPath, String srcImgPath,
                                       String targerPath) {
        markImageByIcon(iconPath, srcImgPath, targerPath, null);
    }

    /**
     * 给图片添加水印、可设置水印图片旋转角度
     *
     * @param iconPath   水印图片路径
     * @param srcImgPath 源图片路径
     * @param targerPath 目标图片路径
     * @param degree     水印图片旋转角度
     */
    public static void markImageByIcon(String iconPath, String srcImgPath,
                                       String targerPath, Integer degree) {
        if (StringUtils.isBlank(iconPath)){
            File waterMarkImageFile = new File(PathKit.getWebRootPath(),"/static/img/water_mark.png");
            iconPath = waterMarkImageFile.toString();
        }

        OutputStream os = null;
        try {
            Image srcImg = ImageIO.read(new File(srcImgPath));
            int srcImgWidth = srcImg.getWidth(null);
            int srcImgHeight = srcImg.getHeight(null);

            BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),
                    srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);

            // 得到画笔对象
            // Graphics g= buffImg.getGraphics();
            Graphics2D g = buffImg.createGraphics();

            // 设置对线段的锯齿状边缘处理
            g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
                    RenderingHints.VALUE_INTERPOLATION_BILINEAR);

            g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), srcImg
                    .getHeight(null), Image.SCALE_SMOOTH), 0, 0, null);

            if (null != degree) {
                // 设置水印旋转
                g.rotate(Math.toRadians(degree),
                        (double) buffImg.getWidth() / 2, (double) buffImg
                                .getHeight() / 2);
            }

            // 水印图象的路径 水印一般为gif或者png的，这样可设置透明度
            ImageIcon imgIcon = new ImageIcon(iconPath);

            // 得到Image对象。
            Image img = imgIcon.getImage();
            int imgIconWidth = img.getWidth(null);//水印图片宽度
            int imgIconHeight = img.getHeight(null);//水印图片高度
            float alpha = 1.0f; // 透明度
            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
                    alpha));

            // 表示水印图片的位置
            int x = (srcImgWidth - imgIconWidth) / 2;
            int y = (srcImgHeight - imgIconHeight) / 2;
            g.drawImage(img, x, y, null);

            g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));

            g.dispose();

            os = new FileOutputStream(targerPath);

            // 生成图片
            ImageIO.write(buffImg, "JPG", os);

            //System.out.println("图片完成添加Icon印章。。。。。。");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != os)
                    os.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
