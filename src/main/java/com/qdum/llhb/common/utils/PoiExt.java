package com.qdum.llhb.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

@SuppressWarnings("all")
public class PoiExt {
	public static Object[][] ReadExcel(InputStream inputStream,int ColCount,int sheetAt) {
    	Object[][] paras = null;
        try {
            HSSFWorkbook wookbook = new HSSFWorkbook(inputStream);
            
            if (sheetAt > (wookbook.getNumberOfSheets() -1)) {
            	sheetAt = (wookbook.getNumberOfSheets() -1);
            }
            HSSFSheet sheet = wookbook.getSheetAt(sheetAt);
            int rows = sheet.getPhysicalNumberOfRows();
            paras = new Object[rows-1][ColCount];
            for (int i = 1; i < rows; i++) {
                HSSFRow row = sheet.getRow(i);
                if (row != null) {
                    for (int j = 0; j < ColCount; j++) {
                        HSSFCell cell = row.getCell(j);
                        if (cell != null) {
                            switch (cell.getCellType()) {
                            case HSSFCell.CELL_TYPE_FORMULA:
                            	paras[i-1][j] = cell.getCellFormula();
                                break;
                            case HSSFCell.CELL_TYPE_NUMERIC:
                            	short format = cell.getCellStyle().getDataFormat();
                        		if (format == 14 || format == 31 || format == 57 ||
                        				format == 58 || format == 177 || format == 186 || format == 197){
                            		DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
                            		paras[i-1][j] = formater.format(cell.getDateCellValue());
                        		} else if (format == 20 || format == 32) {
                            		DateFormat formater = new SimpleDateFormat("HH:mm");
                            		paras[i-1][j] = formater.format(cell.getDateCellValue());
                        		} else {
                            		DecimalFormat df = new DecimalFormat("0");  
         		               		paras[i-1][j] = df.format(cell.getNumericCellValue());
								}
                                break;
                            case HSSFCell.CELL_TYPE_BLANK:
                            	paras[i-1][j] = "";
         		               break;
         		           	case HSSFCell.CELL_TYPE_BOOLEAN:
         		           		paras[i-1][j] = cell.getBooleanCellValue();
         		               break;
         		           	case HSSFCell.CELL_TYPE_ERROR:
         		           		paras[i-1][j] = "";
         		        	   break;
                            case HSSFCell.CELL_TYPE_STRING:
                                paras[i-1][j] = cell.getStringCellValue().trim();
                                break;
                            default:
                                paras[i-1][j] = null;
                                break;
                            }
                        }
                    }
                }
            }
           
        } catch (IOException e) {
        	throw new RuntimeException("导入错误，请检查导入数据");
        }
        return paras;
    }
}
