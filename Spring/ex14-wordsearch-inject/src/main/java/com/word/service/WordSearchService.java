package com.word.service;

import javax.inject.Inject;
import com.word.WordSet;
import com.word.dao.WordDao;

public class WordSearchService {

	@Inject
	private WordDao wordDao;

	public WordSearchService() {
	}

	public WordSearchService(WordDao wordDao) {
		this.wordDao = wordDao;
	}

	public WordSet searchWord(String wordKey) {
		if (verify(wordKey)) {
			return wordDao.select(wordKey);
		} else {
			System.out.println("WordKey information is available.");
		}

		return null;
	}

	// 중복된 단어 등록하지 않기 위함
	public boolean verify(String wordKey) {
		WordSet wordSet = wordDao.select(wordKey);
		return wordSet != null ? true : false;
	}

	public void setWordDao(WordDao wordDao) {
		this.wordDao = wordDao;
	}

}