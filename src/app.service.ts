import { Injectable, OnModuleInit } from '@nestjs/common';
import { ElasticsearchService } from '@nestjs/elasticsearch';

@Injectable()
export class AppService implements OnModuleInit {
  constructor(private readonly elasticsearchService: ElasticsearchService) {}
  async onModuleInit() {
    await this.elasticsearchService.cat.indices().then(console.log);
  }

  getHello(): string {
    return 'Hello World!';
  }
}
