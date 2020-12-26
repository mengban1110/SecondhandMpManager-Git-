package cn.hbsi.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Cell;

public class ExcelUtils {
	public void settings(HttpServletRequest request, HttpServletResponse response, String filename)
			throws UnsupportedEncodingException {
		filename = URLEncoder.encode(filename, "UTF-8");
		response.setHeader("Connection", "close");
		response.setHeader("Content-Type", "application/vnd.ms-excel;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
	}

	@SuppressWarnings("unused")
	public void setColumnAutoAdapter(HSSFSheet sheet, int size) {
		for (int columnNum = 0; columnNum < size; columnNum++) {
			int columnWidth = sheet.getColumnWidth(columnNum) / 256;
			for (int rowNum = 0; rowNum < sheet.getLastRowNum(); rowNum++) {
				HSSFRow currentRow;
				if (sheet.getRow(rowNum) == null) {
					currentRow = sheet.createRow(rowNum);
				} else {
					currentRow = sheet.getRow(rowNum);
				}

				if (currentRow.getCell(columnNum) != null) {
					HSSFCell currentCell = currentRow.getCell(columnNum);
					if (currentCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
						int length = currentCell.getStringCellValue().getBytes().length;
						if (columnWidth < length) {
							columnWidth = length;
						}
					}
				}
			}
			sheet.setColumnWidth(columnNum, columnWidth * 256);
		}
	}
	
	public static String getFormatValue(Cell cell) {
		if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
			int d = (int) cell.getNumericCellValue();
			return String.valueOf(d);
		}else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
			String.valueOf(cell.getBooleanCellValue());
		}
		return cell.getStringCellValue();
	}
}
