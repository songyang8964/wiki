/**
 * 电子书
 */
export interface Ebook {
    id: string;
    name: string;
    category1Id: string;
    category2Id: string;
    description: string;
    cover: string;
    docCount: number;
    viewCount: number;
    voteCount: number;
}

/**
 * 电子书的query表单类
 */
export interface EbookQueryForm {
    name: string;
}

/**
 * 电子书分类
 */
export interface Category {
    id: string;
    name: string;
    parent: string;
    sort: number;
}

/**
 * 电子书分类的query类
 */
export interface CategoryQueryForm {
    name: string;
}


/**
 * 文档类
 */
export interface Doc {
    id: string;
    ebookId: string|null;
    parent: string;
    name: string;
    sort: number;
    viewCount: number;
    voteCount: number;
    content: string;
}

/**
 * 文档的query类
 */
export interface DocQueryForm {
    name: string;
}